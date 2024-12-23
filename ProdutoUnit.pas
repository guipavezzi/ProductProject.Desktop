unit ProdutoUnit;

interface

type
  TProduto = class
  private
    FId: Integer;
    FNome: string;
    FPreco: string;
    FDescricao: string;
  public
    constructor Create(const Id: Integer; const Nome: string; const Preco: string; const Descricao: string);
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    property Preco: string read FPreco write FPreco;
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation

constructor TProduto.Create(const Id: Integer; const Nome: string; const Preco: string; const Descricao: string);
begin
  FId := Id;
  FNome := Nome;
  FPreco := Preco;
  FDescricao := Descricao;
end;

end.

