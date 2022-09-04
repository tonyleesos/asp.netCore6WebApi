//****************************************
// �s����Ʈw�~�|�Ψ�o�@�q�]DB�s���r��^
using Microsoft.EntityFrameworkCore;
using WebApplication2022_Core6_WebApi_JWT.Models_MVC_UserDB;         // �]�ĤG�ӽd�Ҥ~�|�Ψ�^  �s����Ʈw
using WebApplication2022_Core6_WebApi_JWT.Models_MVC_UserLogin;    // �][�^�a�@�~ HomeWork] �~�|�Ψ�^  �s����Ʈw 
//****************************************
// JWT (json web token) �~�|�Ψ�o�@�q
using Microsoft.AspNetCore.Authentication.JwtBearer;
using WebApplication2022_Core6_WebApi_JWT.JwtServices;  // ��� /JwtServices�ؿ��U�AToken���۩󦹡C
using System.Text;
using Microsoft.IdentityModel.Tokens;
//****************************************
// ��ƨӷ��Ghttps://medium.com/the-innovation/asp-net-core-3-authorization-and-authentication-with-bearer-and-jwt-3041c47c8b1d
//         �]��W���o�@�g�ۦP�^https://levelup.gitconnected.com/asp-net-5-authorization-and-authentication-with-bearer-and-jwt-2d0cef85dc5d
//                    https://www.cnblogs.com/nsky/p/10312101.html
//                    https://medium.com/@szaloki/jwt-authentication-between-asp-net-core-and-angular-part-1-asp-net-core-315af889fdce
//                    https://www.c-sharpcorner.com/article/authentication-and-authorization-in-asp-net-5-with-jwt-and-swagger/
//                    https://www.c-sharpcorner.com/article/how-to-use-jwt-authentication-with-web-api/

// �Х��˳o�� Nuget�M�� -- 
//(1) Microsoft.AspNetCore.Authentication
//(2) Microsoft.AspNetCore.Authentication.JwtBearer  // JWT�|�Ψ�
//(3) Microsoft.EntityFrameworkCore               // ��Ʈw�|�Ψ�
//(4) Microsoft.EntityFrameworkCore.Tools    // ��Ʈw�|�Ψ�
//(5) Microsoft.EntityFrameworkCore.SqlServer  // SQL Server�|�Ψ�
//(6) System.Security.Claims

// ���d�ҷf�t HomeController�]�`�N�I�o�O API����I�^




var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// �]�ȮɨS�Ψ�^�קKClient�ݼgJS�ɡA�J�����D�u���l�ӷ��n�D (CORS)  / Access - Control - Allow - Origin�v
string MyAllowSpecificOriginsCORS = "_myAllowSpecificOrigins";

#region  // �]�ȮɨS�Ψ�^ �קKClient�ݼgJS�ɡA�J�����D�u���l�ӷ��n�D (CORS)  / Access - Control - Allow - Origin�v
// https://docs.microsoft.com/zh-tw/aspnet/core/security/cors?view=aspnetcore-5.0
builder.Services.AddCors(options =>
{
    options.AddPolicy(name: MyAllowSpecificOriginsCORS,
                      builder =>
                      {
                          builder.WithOrigins("*");   // �����}��
                                                      //builder.WithOrigins("http://example.com", "http://www.contoso.com");  // ���w�Y�Ǻ����~��s��
                          });
});
#endregion


builder.Services.AddControllers();


#region              // �]�Ĥ@�ӽd�ҡ^  JWT (json web token) �~�|�Ψ�o�@�q
//********************************************************************   
// �o�̻ݭn�s�W �ܦh���R�W�Ŷ��A�ШϥΡu��ܥi�઺�ץ��v���t�Φۤv�[�W�C
var key = Encoding.UTF8.GetBytes(Settings.Secret);  // ��� /JwtServices�ؿ��U��Settings���O�]�f�t System.Text�R�W�Ŷ��^

builder.Services.AddAuthentication(z =>
{
    z.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    z.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(x =>
{
    x.RequireHttpsMetadata = false;
    x.SaveToken = true;

                // �����ҥ��ѮɡA�^�����Y�|�]�t WWW-Authenticate ���Y�A�o�̷|��ܥ��Ѫ��Բӿ��~��]
                x.IncludeErrorDetails = true; // �w�]�Ȭ� true

                x.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuerSigningKey = true,

                    // ���U�T�ӳ]�w�ݩʤ]�i�H�g�b appsettings.json�ɮסChttps://www.cnblogs.com/nsky/p/10312101.html
                    IssuerSigningKey = new SymmetricSecurityKey(key),
                    // �άO�g�� IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("�z�ۤv��J��Secret Hash�ƭ�"))
                    // (1) �Ψ����� (Hash) ���ê�����ƭ�

                    ValidateIssuer = false,        // (2) �O�ֵ֮o���H  (false ������)
                    ValidateAudience = false  // (3) ���ǫȤ�]Client�^�i�H�ϥΡH  (false ������)

                    // === TokenValidationParameters���Ѽ� (�w�]��) ====
                    // https://docs.microsoft.com/zh-tw/dotnet/api/microsoft.identitymodel.tokens.tokenvalidationparameters?view=azure-dotnet
                    // RequireSignedTokens = true,
                    // SaveSigninToken = false,
                    // ValidateActor = false,

                    // �N�U����ӰѼƳ]�m��false�A�N���|���� Issuer�M Audience�A���O����ĳ�o�˰��C
                    // ValidateAudience = true,     // �O�ֵ֮o���H 
                    // ValidateIssuer = true,            // ���ǫȤ�]Client�^�i�H�ϥΡH 
                    // ValidateIssuerSigningKey = false,  // �p�Gtoken ���]�t key �~�ݭn���ҡA�@�볣�u��ñ���Ӥw

                    // �O�_�n�DToken��Claims�������]�tExpires�]�L���ɶ��^
                    // RequireExpirationTime = true,

                    // ���\�����A���ɶ������q
                    // ClockSkew = TimeSpan.FromSeconds(300),

                    // �O�_���� token���Ĵ����A�ϥη�e�ɶ��P token�� Claims����NotBefore�MExpires���
                    // ValidateLifetime = true
                };
});
// ������A���U�٦��@�q app.UseAuthentication();   �ݭn�ۤv�ʤ�[�W
//********************************************************************
#endregion

#region              // �]�ĤG�ӽd�Ҥ~�|�Ψ�^  �s����Ʈw�~�|�Ψ�o�@�q�]DB�s���r��^
//********************************************************************            
// �o�̪�����r<MVC_UserDBContext>�A
// �и� /Models_MVC_UserDB�ؿ��U�uMVC_UserDBContext.cs�v���O�W�٤@�Ҥ@�ˡC

//**** Ū�� appsettings.json �]�w�ɸ̭�����ơ]��Ʈw�s���r��^****
////�@�k�@�G
builder.Services.AddDbContext<MVC_UserDBContext>(options => options.UseSqlServer("Server=.\\sqlexpress;Database=MVC_UserDB;Trusted_Connection=True;MultipleActiveResultSets=true"));
//// �o�̻ݭn�s�W��өR�W�Ŷ��A�ШϥΡu��ܥi�઺�ץ��v���t�Φۤv�[�W�C

////�@�k�G�G Ū���]�w�ɪ����e
//// ��ƨӷ�  �{���X  https://github.com/CuriousDrive/EFCore.AllDatabasesConsidered/blob/main/MS%20SQL%20Server/Northwind.MSSQL/Program.cs
//builder.Services.AddDbContext<MVC_UserDBContext>(
//        options =>
//        {
//            options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
//        });

////�@�k�T�G Ū���]�w�ɪ����e
//var configurationBuilder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json");
//IConfiguration config = configurationBuilder.Build();   // ConfigurationBuilder�|�Ψ� Microsoft.Extensions.Configuration�R�W�Ŷ�
//string DBconnectionString = config["ConnectionStrings:DefaultConnection"];  // appsettings.josn�ɸ̭����u��Ʈw�s���r��v
//builder.Services.AddDbContext<MVC_UserDBContext>(options => options.UseSqlServer(DBconnectionString));

// (1)  �o�̻ݭn�s�W Microsoft.EntityFrameworkCore �R�W�Ŷ��A�ШϥΡu��ܥi�઺�ץ��v���t�Φۤv�[�W�C
// (2)  �Цb appsettings.json�]�w�ɸ̭��A�ۤv�[�W  "ConnectionStrings": { ...... }
// (3)  �����H��A�Э��s�u�ظm�M�סv�ˬd�O�_�٦����~�H
//********************************************************************
#endregion


#region              // �][�^�a�@�~ HomeWork] �~�|�Ψ�^  �s����Ʈw�~�|�Ψ�o�@�q�]DB�s���r��^
//********************************************************************            
// �o�̪�����r<MVC_UserLoginContext>�A
// �и� /Models_MVC_UserLogin�ؿ��U�uMVC_UserLoginContext.cs�v���O�W�٤@�Ҥ@�ˡC

//**** Ū�� appsettings.json �]�w�ɸ̭�����ơ]��Ʈw�s���r��^****
////�@�k�@�G
builder.Services.AddDbContext<MVC_UserLoginContext>(options => options.UseSqlServer("Server=.\\sqlexpress;Database=MVC_UserLogin;Trusted_Connection=True;MultipleActiveResultSets=true"));
//// �o�̻ݭn�s�W��өR�W�Ŷ��A�ШϥΡu��ܥi�઺�ץ��v���t�Φۤv�[�W�C

////�@�k�G�G Ū���]�w�ɪ����e
//// ��ƨӷ�  �{���X  https://github.com/CuriousDrive/EFCore.AllDatabasesConsidered/blob/main/MS%20SQL%20Server/Northwind.MSSQL/Program.cs
//builder.Services.AddDbContext<MVC_UserDBContext>(
//        options =>
//        {
//            options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
//        });

////�@�k�T�G Ū���]�w�ɪ����e
//var configurationBuilder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json");
//IConfiguration config = configurationBuilder.Build();   // ConfigurationBuilder�|�Ψ� Microsoft.Extensions.Configuration�R�W�Ŷ�
//string DBconnectionString = config["ConnectionStrings:HomeLoginConnection"];  // appsettings.josn�ɸ̭����u��Ʈw�s���r��v
//builder.Services.AddDbContext<MVC_UserLoginContext>(options => options.UseSqlServer(DBconnectionString));

// (1)  �o�̻ݭn�s�W Microsoft.EntityFrameworkCore �R�W�Ŷ��A�ШϥΡu��ܥi�઺�ץ��v���t�Φۤv�[�W�C
// (2)  �Цb appsettings.json�]�w�ɸ̭��A�ۤv�[�W  "ConnectionStrings": { ...... }
// (3)  �����H��A�Э��s�u�ظm�M�סv�ˬd�O�_�٦����~�H
//********************************************************************
#endregion


// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();



//=== �� �j �u ===============================================================



var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

// �]�ȮɨS�Ψ�^�קKClient�ݼgJS�ɡA�J�����D�u���l�ӷ��n�D (CORS)  / Access - Control - Allow - Origin�v
app.UseCors(MyAllowSpecificOriginsCORS);
//********************************************

//**************************************************************
// JWT (json web token) �~�|�Ψ�o�@�q�C������b app.UseAuthorization();���e�A���Ǥ�����I
app.UseAuthentication();      // ** JWT �Цۤv�ʤ�[�W�o�@�q **
//***************************************************************
app.UseAuthorization();       // ���Ǥ�����I

app.MapControllers();

app.Run();
