namespace Application.Common.Interfaces;

public interface IEmail
{
    void Setup(string mailServer);
    void SendEmail(string fromAddress, string fromDisplayName, string to, string subject, string body, ref int returnCode, ref string message);
}
