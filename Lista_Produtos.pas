unit Lista_Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Form_Cadastro_Produto,
  Vcl.ComCtrls, IdHTTP, IdSSL, IdSSLOpenSSL, System.JSON, Vcl.Buttons;

type
  Tlista_produto = class(TForm)
    title_lista: TLabel;
    btn_form_cadastro: TPanel;
    Lista_Produtos_Table: TListView;
    procedure FormCreate(Sender: TObject);
    procedure btn_form_cadastroClick(Sender: TObject);
  private
    procedure BuscarProdutosDaAPI;
    procedure ExcluirProdutoClick(Sender: TObject);
    procedure ExcluirProdutoDaAPI(Id: Integer);
  public
    procedure AtualizarLista;
  end;

var
  lista_produto: Tlista_produto;

implementation

{$R *.dfm}

procedure Tlista_produto.AtualizarLista;
begin
  BuscarProdutosDaAPI;
end;

procedure Tlista_produto.btn_form_cadastroClick(Sender: TObject);
begin
  form_cadastro := Tform_cadastro.Create(Self);
  try
    form_cadastro.ShowModal;
    AtualizarLista;
  finally
    form_cadastro.Free;
  end;
end;

procedure Tlista_produto.ExcluirProdutoClick(Sender: TObject);
var
  BtnExcluir: TSpeedButton;
  ProdutoId: Integer;
begin
  BtnExcluir := Sender as TSpeedButton;
  ProdutoId := BtnExcluir.Tag;

  if MessageDlg('Tem certeza que deseja excluir este produto?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      ExcluirProdutoDaAPI(ProdutoId);

      AtualizarLista;

      ShowMessage('Produto exclu�do com sucesso!');
    except
      on E: Exception do
        ShowMessage('Erro ao excluir produto: ' + E.Message);
    end;
  end;
end;

procedure Tlista_produto.ExcluirProdutoDaAPI(Id: Integer);
var
  IdHTTP: TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  URL: string;
begin
  IdHTTP := TIdHTTP.Create(nil);
  SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SSLHandler.SSLOptions.Method := sslvTLSv1_2;
    IdHTTP.IOHandler := SSLHandler;

    URL := Format('https://productsproject-production.up.railway.app/product/%d', [Id]);

    try
      IdHTTP.Delete(URL);
    except
      on E: Exception do
        raise Exception.Create('Erro ao excluir o produto: ' + E.Message);
    end;
  finally
    SSLHandler.Free;
    IdHTTP.Free;
  end;
end;

procedure Tlista_produto.BuscarProdutosDaAPI;
var
  IdHTTP: TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  JSONString: string;
  JSONArray: TJSONArray;
  JSONValue: TJSONValue;
  ProdutoJSON: TJSONObject;
  Item: TListItem;
  BtnExcluir: TSpeedButton;
begin
  IdHTTP := TIdHTTP.Create(nil);
  SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SSLHandler.SSLOptions.Method := sslvTLSv1_2;
    IdHTTP.IOHandler := SSLHandler;

    try

      JSONString := IdHTTP.Get('https://productsproject-production.up.railway.app/product');
      JSONArray := TJSONObject.ParseJSONValue(JSONString) as TJSONArray;

      Lista_Produtos_Table.Items.Clear;

      for JSONValue in JSONArray do
      begin
        ProdutoJSON := JSONValue as TJSONObject;

        Item := Lista_Produtos_Table.Items.Add;
        Item.Caption := ProdutoJSON.GetValue<string>('name');
        Item.SubItems.Add(ProdutoJSON.GetValue<string>('price'));
        Item.SubItems.Add(ProdutoJSON.GetValue<string>('description'));

        BtnExcluir := TSpeedButton.Create(Lista_Produtos_Table);
        BtnExcluir.Parent := Lista_Produtos_Table;
        BtnExcluir.Caption := 'Excluir';
        BtnExcluir.Tag := ProdutoJSON.GetValue<Integer>('id');
        BtnExcluir.OnClick := ExcluirProdutoClick;

        BtnExcluir.Width := 70;
        BtnExcluir.Height := 25;
        BtnExcluir.Left := Lista_Produtos_Table.ClientWidth - BtnExcluir.Width - 10;
        BtnExcluir.Top := Item.DisplayRect(drBounds).Top;
      end;
    except
      on E: Exception do
        ShowMessage('Erro ao buscar produtos: ' + E.Message);
    end;
  finally
    SSLHandler.Free;
    IdHTTP.Free;
  end;
end;

procedure Tlista_produto.FormCreate(Sender: TObject);
begin
  Self.BorderStyle := bsDialog;
  Self.Constraints.MinWidth := Self.Width;
  Self.Constraints.MinHeight := Self.Height;

  Lista_Produtos_Table.ViewStyle := vsReport;

  Lista_Produtos_Table.Columns.Add.Caption := 'Nome';
  Lista_Produtos_Table.Columns.Add.Caption := 'Pre�o';
  Lista_Produtos_Table.Columns.Add.Caption := 'Descri��o';

  Lista_Produtos_Table.Columns[0].Width := 150;
  Lista_Produtos_Table.Columns[1].Width := 100;
  Lista_Produtos_Table.Columns[2].Width := 200;

  BuscarProdutosDaAPI;
end;

end.

