namespace Phoenix.CrossCutting.Security.Criptography
{
    public interface ICryptography
    {
        string Encrypt(string source, string key);

        string Decrypt(string encodedText, string key);
    }
}
