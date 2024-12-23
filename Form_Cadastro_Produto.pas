unit Form_Cadastro_Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IdHTTP, IdSSL, IdSSLOpenSSL, System.JSON,
  ProdutoUnit;

type
  Tform_cadastro = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditNome: TEdit;
    editPreco: TEdit;
    editDescricao: TEdit;
    btn_form_cadastro: TPanel;
    procedure btn_form_cadastroClick(Sender: TObject);
  private
    procedure CadastrarProdutoNaAPI(const Produto: TProduto);
  public
    { Public declarations }
  end;

var
  form_cadastro: Tform_cadastro;

implementation

{$R *.dfm}

uses
  Lista_Produtos;

procedure Tform_cadastro.btn_form_cadastroClick(Sender: TObject);
var
  Nome, Preco, Descricao: string;
  Produto: TProduto;
begin
  Nome := EditNome.Text;
  Preco := editPreco.Text;
  Descricao := editDescricao.Text;

  if (Nome = '') or (Preco = '') or (Descricao = '') then
  begin
    ShowMessage('Por favor, preencha todos os campos.');
    Exit;
  end;

  Produto := TProduto.Create(0, Nome, Preco, Descricao);

  try
    CadastrarProdutoNaAPI(Produto);

    ShowMessage('Produto cadastrado com sucesso!');
    EditNome.Clear;
    editPreco.Clear;
    editDescricao.Clear;

    if Assigned(lista_produto) then
      lista_produto.AtualizarLista;
  finally
    Produto.Free;
  end;
end;

procedure Tform_cadastro.CadastrarProdutoNaAPI(const Produto: TProduto);
var
  IdHTTP: TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  JSONBody: TJSONObject;
  JSONString: TStringStream;
  URL: string;
begin
  IdHTTP := TIdHTTP.Create(nil);
  SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SSLHandler.SSLOptions.Method := sslvTLSv1_2;
    IdHTTP.IOHandler := SSLHandler;

    URL := 'https://productsproject-production.up.railway.app/product';

    JSONBody := TJSONObject.Create;
    JSONBody.AddPair('name', Produto.Nome);
    JSONBody.AddPair('price', Produto.Preco);
    JSONBody.AddPair('description', Produto.Descricao);

    JSONString := TStringStream.Create(JSONBody.ToString, TEncoding.UTF8);

    try
      IdHTTP.Request.ContentType := 'application/json';
      IdHTTP.Post(URL, JSONString);
    except
      on E: Exception do
        ShowMessage('Erro ao cadastrar produto: ' + E.Message);
    end;

  finally
    JSONBody.Free;
    JSONString.Free;
    SSLHandler.Free;
    IdHTTP.Free;
  end;
end;

end.

