using System.Linq;

namespace Phoenix.CrossCutting.Utils.Validation
{
    public abstract class Validator<T>
    {
        public abstract ValidatorResult Validate(T obj);

        public void ValidateThrowException(T obj)
        {
            var result = this.Validate(obj);

            if (!result.IsValid)
            {
                var message = string.Join(" ", result.Errors.Select(x => x.Value));
            }
        }
    }
}
