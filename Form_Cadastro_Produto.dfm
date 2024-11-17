object form_cadastro: Tform_cadastro
  Left = 0
  Top = 0
  Caption = 'form_cadastro'
  ClientHeight = 383
  ClientWidth = 368
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 67
    Top = 24
    Width = 246
    Height = 37
    Caption = 'Cadastro de Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 133
    Width = 57
    Height = 30
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 16
    Top = 205
    Width = 52
    Height = 30
    Caption = 'Pre'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 16
    Top = 269
    Width = 90
    Height = 30
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object EditNome: TEdit
    Left = 128
    Top = 133
    Width = 201
    Height = 32
    TabOrder = 0
  end
  object editPreco: TEdit
    Left = 128
    Top = 205
    Width = 201
    Height = 32
    TabOrder = 1
  end
  object editDescricao: TEdit
    Left = 128
    Top = 278
    Width = 201
    Height = 30
    TabOrder = 2
  end
  object btn_form_cadastro: TPanel
    Left = 87
    Top = 334
    Width = 185
    Height = 41
    Cursor = crHandPoint
    Caption = 'Salvar'
    Color = clLawngreen
    ParentBackground = False
    TabOrder = 3
    OnClick = btn_form_cadastroClick
  end
end
