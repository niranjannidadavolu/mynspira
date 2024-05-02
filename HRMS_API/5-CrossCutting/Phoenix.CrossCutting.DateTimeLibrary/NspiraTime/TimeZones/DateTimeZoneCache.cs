// Copyright 2010 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using System.Collections.Concurrent;
using System.Collections.ObjectModel;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Annotations;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.TimeZones
{
    /// <summary>
    /// Provides an implementation of <see cref="IDateTimeZoneProvider"/> that caches results from an
    /// <see cref="IDateTimeZoneSource"/>.
    /// </summary>
    /// <remarks>
    /// The process of loading or creating time zones may be an expensive operation. This class implements an
    /// unlimited-size non-expiring cache over a time zone source, and adapts an implementation of the
    /// <c>IDateTimeZoneSource</c> interface to an <c>IDateTimeZoneProvider</c>.
    /// </remarks>
    /// <seealso cref="DateTimeZoneProviders"/>
    /// <threadsafety>All members of this type are thread-safe as long as the underlying <c>IDateTimeZoneSource</c>
    /// implementation is thread-safe.</threadsafety>
    [Immutable] // Public only; caches are naturally mutable internally.
    public sealed class DateTimeZoneCache : IDateTimeZoneProvider
    {
        private readonly IDateTimeZoneSource source;
        private readonly ConcurrentDictionary<string, DateTimeZone?> timeZoneMap = new ConcurrentDictionary<string, DateTimeZone?>();

        /// <summary>
        /// Gets the version ID of this provider. This is simply the <see cref="IDateTimeZoneSource.VersionId"/> returned by
        /// the underlying source.
        /// </summary>
        /// <value>The version ID of this provider.</value>
        public string VersionId { get; }

        /// <inheritdoc />
        public ReadOnlyCollection<string> Ids { get; }

        /// <summary>
        /// Creates a provider backed by the given <see cref="IDateTimeZoneSource"/>.
        /// </summary>
        /// <remarks>
        /// Note that the source will never be consulted for requests for the fixed-offset timezones "UTC" and
        /// "UTC+/-Offset" (a standard implementation will be returned instead). This is true even if these IDs are
        /// advertised by the source.
        /// </remarks>
        /// <param name="source">The <see cref="IDateTimeZoneSource"/> for this provider.</param>
        /// <exception cref="InvalidDateTimeZoneSourceException"><paramref name="source"/> violates its contract.</exception>
        public DateTimeZoneCache(IDateTimeZoneSource source)
        {
            this.source = Preconditions.CheckNotNull(source, nameof(source));
            this.VersionId = source.VersionId;
            if (VersionId is null)
            {
                throw new InvalidDateTimeZoneSourceException("Source-returned version ID was null");
            }
            var providerIds = source.GetIds();
            if (providerIds is null)
            {
                throw new InvalidDateTimeZoneSourceException("Source-returned ID sequence was null");
            }
            var idList = new List<string>(providerIds);
            idList.Sort(StringComparer.Ordinal);
            Ids = new ReadOnlyCollection<string>(idList);
            // Populate the dictionary with null values meaning "the ID is valid, we haven't fetched the zone yet".
            foreach (string id in Ids)
            {
                if (id is null)
                {
                    throw new InvalidDateTimeZoneSourceException("Source-returned ID sequence contained a null reference");
                }
                timeZoneMap[id] = null;
            }
        }

        /// <inheritdoc />
        public DateTimeZone GetSystemDefault()
        {
            string? id = source.GetSystemDefaultId();
            if (id is null)
            {
                throw new DateTimeZoneNotFoundException($"System default time zone is unknown to source {VersionId}");
            }
            return this[id];
        }

        /// <inheritdoc />
        public DateTimeZone? GetZoneOrNull(string id)
        {
            Preconditions.CheckNotNull(id, nameof(id));
            return GetZoneFromSourceOrNull(id) ?? FixedDateTimeZone.GetFixedZoneOrNull(id);
        }

        private DateTimeZone? GetZoneFromSourceOrNull(string id)
        {
            if (!timeZoneMap.TryGetValue(id, out DateTimeZone? zone))
            {
                return null;
            }
            // Ask the source for the zone. Multiple threads *may* do the same thing, but
            // that's hidden from the user: only one thread will update the map, and
            // all other threads will use that value.
            if (zone is null)
            {
                zone = source.ForId(id);
                if (zone is null)
                {
                    throw new InvalidDateTimeZoneSourceException(
                        $"Time zone {id} is supported by source {VersionId} but not returned");
                }
                // 
                return timeZoneMap.TryUpdate(id, zone, null) ? zone : timeZoneMap[id];
            }
            return zone;
        }

        /// <inheritdoc />
        public DateTimeZone this[string id]
        {
            get
            {
                var zone = GetZoneOrNull(id);
                if (zone is null)
                {
#pragma warning disable CA1065 // Don't throw an exception from an indexer
                    throw new DateTimeZoneNotFoundException($"Time zone {id} is unknown to source {VersionId}");
#pragma warning restore CA1065
                }
                return zone;
            }
        }
    }
}
