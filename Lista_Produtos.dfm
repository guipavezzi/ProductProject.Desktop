object lista_produto: Tlista_produto
  Left = 0
  Top = 0
  Caption = 'Lista de Produtos'
  ClientHeight = 733
  ClientWidth = 1014
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object title_lista: TLabel
    Left = 384
    Top = 40
    Width = 246
    Height = 34
    Caption = 'Lista de Produtos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_form_cadastro: TPanel
    Left = 408
    Top = 664
    Width = 185
    Height = 41
    Cursor = crHandPoint
    Caption = 'Cadastrar novo produto'
    Color = clGreenyellow
    ParentBackground = False
    TabOrder = 0
    OnClick = btn_form_cadastroClick
  end
  object Lista_Produtos_Table: TListView
    Left = 168
    Top = 96
    Width = 705
    Height = 545
    BevelWidth = 6
    Columns = <>
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
end
