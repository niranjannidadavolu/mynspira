
namespace Phoenix.CrossCutting.TimePeriod
{

	public class AmbiguousMomentException : Exception
	{
		public AmbiguousMomentException(DateTime moment)
		{
			this.moment = moment;
		} 
		public AmbiguousMomentException(DateTime moment, string message) :
			base(message)
		{
			this.moment = moment;
		}
		public AmbiguousMomentException(DateTime moment, Exception cause) :
			base(cause.Message, cause)
		{
			this.moment = moment;
		} 
		public AmbiguousMomentException(DateTime moment, string message, Exception cause) :
			base(message, cause)
		{
			this.moment = moment;
		}
		public DateTime Moment
		{
			get { return moment; }
		}
		private readonly DateTime moment;

	} 
}