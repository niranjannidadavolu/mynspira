using System.Collections.Generic;

namespace Phoenix.CrossCutting.Utils.Validation
{
    public sealed class ValidatorResult
    {
        public IDictionary<string, string> Errors { get; } = new Dictionary<string, string>();

        public bool IsValid => this.Errors == null || this.Errors.Count == 0;
    }
}
