program CrudProject;

uses
  Vcl.Forms,
  Lista_Produtos in 'Lista_Produtos.pas' {lista_produto},
  Form_Edicao_Produto in 'Form_Edicao_Produto.pas' {form_edicao},
  ProdutoUnit in 'ProdutoUnit.pas',
  Form_Cadastro_Produto in 'Form_Cadastro_Produto.pas' {form_cadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tlista_produto, lista_produto);
  Application.CreateForm(Tform_edicao, form_edicao);
  Application.CreateForm(Tform_cadastro, form_cadastro);
  Application.Run;
end.
