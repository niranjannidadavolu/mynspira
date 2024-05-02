namespace Phoenix.CrossCutting.Extension.System.DateTime
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A DateTime extension method that ages the given this.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>An int.</returns>
        public static string Ago(this global::System.DateTime @this)
        {
            var timeSpan = global::System.DateTime.Now.Subtract(@this);

            string result;
            if (timeSpan <= global::System.TimeSpan.FromSeconds(60))
            {
                result = string.Format("{0} seconds ago", timeSpan.Seconds);
            }
            else if (timeSpan <= global::System.TimeSpan.FromMinutes(60))
            {
                result = timeSpan.Minutes > 1 ?
                    string.Format("about {0} minutes ago", timeSpan.Minutes) :
                    "about a minute ago";
            }
            else if (timeSpan <= global::System.TimeSpan.FromHours(24))
            {
                result = timeSpan.Hours > 1 ?
                    string.Format("about {0} hours ago", timeSpan.Hours) :
                    "about an hour ago";
            }
            else if (timeSpan <= global::System.TimeSpan.FromDays(30))
            {
                result = timeSpan.Days > 1 ?
                    string.Format("about {0} days ago", timeSpan.Days) :
                    "yesterday";
            }
            else if (timeSpan <= global::System.TimeSpan.FromDays(365))
            {
                result = timeSpan.Days > 30 ?
                    string.Format("about {0} months ago", timeSpan.Days / 30) :
                    "about a month ago";
            }
            else
            {
                result = timeSpan.Days > 365 ?
                    string.Format("about {0} years ago", timeSpan.Days / 365) :
                    "about a year ago";
            }

            return result;

        }
    }
}