namespace WebApi.Services
{
    public class HelloWorldService:IHelloWorldService
    {
        public string GetHelloWorld()
        {
            return "Hello";
        }

    }

    public interface IHelloWorldService
    {
        string GetHelloWorld();
    }
}
