﻿// Copyright 2013 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using System.Collections.ObjectModel;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Annotations;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.TimeZones.IO;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.TimeZones.Cldr
{
    /// <summary>
    /// Represents a single <c>&lt;mapZone&gt;</c> element in the CLDR Windows zone mapping file. 
    /// </summary>
    /// <remarks>
    /// <para>
    /// Equality is defined in a component-wise fashion. When comparing two values for equality, the <see cref="TzdbIds"/> properties
    /// must return the same IDs in the same order for the values to be considered equal.
    /// </para>
    /// </remarks>
    /// <threadsafety>This type is immutable reference type. See the thread safety section of the user guide for more information.</threadsafety>
    [Immutable]
    public sealed class MapZone : IEquatable<MapZone?>
    {
        /// <summary>
        /// Identifier used for the primary territory of each Windows time zone. A zone mapping with
        /// this territory will always have a single entry. The value of this constant is "001".
        /// </summary>
        public const string PrimaryTerritory = "001";
        /// <summary>
        /// Identifier used for the "fixed offset" territory. A zone mapping with
        /// this territory will always have a single entry. The value of this constant is "ZZ".
        /// </summary>
        public const string FixedOffsetTerritory = "ZZ";

        /// <summary>
        /// Gets the Windows system time zone identifier for this mapping, such as "Central Standard Time".
        /// </summary>
        /// <remarks>
        /// <para>
        /// Most Windows system time zone identifiers use the name for the "standard" part of the zone as
        /// the overall identifier. Don't be fooled: just because a time zone includes "standard" in its identifier
        /// doesn't mean that it doesn't observe daylight saving time.
        /// </para>
        /// </remarks>
        /// <value>The Windows system time zone identifier for this mapping, such as "Central Standard Time".</value>
        public string WindowsId { get; }

        /// <summary>
        /// Gets the territory code for this mapping.
        /// </summary>
        /// <remarks>
        /// This is typically either "001" to indicate that it's the primary territory for this ID, or
        /// "ZZ" to indicate a fixed-offset ID, or a different two-character capitalized code
        /// which indicates the geographical territory.
        /// </remarks>
        /// <value>The territory code for this mapping.</value>
        public string Territory { get; }

        /// <summary>
        /// Gets a read-only non-empty collection of TZDB zone identifiers for this mapping, such as
        /// "America/Chicago" and "America/Matamoros" (both of which are TZDB zones associated with the "Central Standard Time"
        /// Windows system time zone).
        /// </summary>
        /// <remarks>
        /// For the primary and fixed-offset territory IDs ("001" and "ZZ") this always
        /// contains exactly one time zone ID. The IDs returned are not necessarily canonical in TZDB.
        /// </remarks>
        /// <value>A read-only non-empty collection of TZDB zone identifiers for this mapping.</value>
        public IList<string> TzdbIds { get; }

        /// <summary>
        /// Creates a new mapping entry.
        /// </summary>
        /// <remarks>
        /// This constructor is only public for the sake of testability.
        /// </remarks>
        /// <param name="windowsId">Windows system time zone identifier. Must not be null.</param>
        /// <param name="territory">Territory code. Must not be null.</param>
        /// <param name="tzdbIds">List of territory codes. Must not be null, and must not
        /// contains null values.</param>
        public MapZone(string windowsId, string territory, IList<string> tzdbIds)
            : this(Preconditions.CheckNotNull(windowsId, nameof(windowsId)),
                   Preconditions.CheckNotNull(territory, nameof(territory)),
                   new ReadOnlyCollection<string>(new List<string>(Preconditions.CheckNotNull(tzdbIds, nameof(tzdbIds)))))
        {
        }

        /// <summary>
        /// Private constructor to avoid unnecessary list copying (and validation) when deserializing.
        /// </summary>
        private MapZone(string windowsId, string territory, ReadOnlyCollection<string> tzdbIds)
        {
            this.WindowsId = windowsId;
            this.Territory = territory;
            this.TzdbIds = tzdbIds;
        }

        /// <summary>
        /// Reads a mapping from a reader.
        /// </summary>
        internal static MapZone Read(IDateTimeZoneReader reader)
        {
            string windowsId = reader.ReadString();
            string territory = reader.ReadString();
            int count = reader.ReadCount();
            string[] tzdbIds = new string[count];
            for (int i = 0; i < count; i++)
            {
                tzdbIds[i] = reader.ReadString();
            }
            return new MapZone(windowsId, territory, new ReadOnlyCollection<string>(tzdbIds));
        }

        /// <summary>
        /// Writes this mapping to a writer.
        /// </summary>
        /// <param name="writer"></param>
        internal void Write(IDateTimeZoneWriter writer)
        {
            writer.WriteString(WindowsId);
            writer.WriteString(Territory);
            writer.WriteCount(TzdbIds.Count);
            foreach (string id in TzdbIds)
            {
                writer.WriteString(id);
            }
        }

        /// <summary>
        /// Compares two <see cref="MapZone"/> values for equality.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <param name="other">The value to compare this map zone with.</param>
        /// <returns>True if the given value is another map zone equal to this one; false otherwise.</returns>
        public bool Equals(MapZone? other) =>
            other != null &&
            WindowsId == other.WindowsId &&
            Territory == other.Territory &&
            TzdbIds.SequenceEqual(other.TzdbIds);

        /// <summary>
        /// Returns a hash code for this map zone.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <returns>A hash code for this map zone.</returns>
        public override int GetHashCode()
        {
            var hash = HashCodeHelper.Initialize().Hash(WindowsId).Hash(Territory);
            foreach (var id in TzdbIds)
            {
                hash = hash.Hash(id);
            }
            return hash.Value;
        }

        /// <summary>
        /// Compares two <see cref="MapZone"/> values for equality.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <param name="obj">The value to compare this map zone with.</param>
        /// <returns>True if the given value is another map zone equal to this one; false otherwise.</returns>
        public override bool Equals(object? obj) => Equals(obj as MapZone);

        /// <summary>
        /// Returns a <see cref="System.String" /> that represents this instance.
        /// </summary>
        /// <returns>
        /// The value of the current instance, for diagnostic purposes.
        /// </returns>
        public override string ToString()
            => $"Windows ID: {WindowsId}; Territory: {Territory}; TzdbIds: {string.Join(" ", TzdbIds)}";
    }
}
