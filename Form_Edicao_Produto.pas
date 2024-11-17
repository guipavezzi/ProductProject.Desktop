unit Form_Edicao_Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  Tform_edicao = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_edicao: Tform_edicao;

implementation

{$R *.dfm}

procedure Tform_edicao.FormCreate(Sender: TObject);
begin
  Self.BorderStyle := bsDialog;
  Self.Constraints.MinWidth := Self.Width;
  Self.Constraints.MinWidth := Self.Width;
end;

end.
