object Flaporanservice: TFlaporanservice
  Left = 193
  Top = 177
  Width = 442
  Height = 201
  Caption = 'Laporan Transaksi Service'
  Color = 9568255
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 409
    Height = 145
    Color = clWhite
    ParentColor = False
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 74
      Height = 16
      Caption = 'Per Nota  :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape1: TShape
      Left = 8
      Top = 48
      Width = 393
      Height = 1
    end
    object Label4: TLabel
      Left = 24
      Top = 56
      Width = 75
      Height = 16
      Caption = 'Pilih          :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 240
      Top = 88
      Width = 24
      Height = 16
      Caption = '- - -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 104
      Top = 16
      Width = 209
      Height = 21
      Color = 9568255
      TabOrder = 0
    end
    object ComboBox1: TComboBox
      Left = 104
      Top = 56
      Width = 209
      Height = 21
      Color = 9568255
      ItemHeight = 13
      TabOrder = 1
      Text = 'Pilih'
      OnChange = ComboBox1Change
      OnKeyPress = ComboBox1KeyPress
      Items.Strings = (
        'Tanggal'
        'Bulan'
        'Tahun')
    end
    object DTPawal: TDateTimePicker
      Left = 104
      Top = 88
      Width = 129
      Height = 21
      Date = 43449.703413148150000000
      Time = 43449.703413148150000000
      Color = 9568255
      DateFormat = dfLong
      TabOrder = 2
      OnChange = DTPawalChange
    end
    object DTPakhir: TDateTimePicker
      Left = 272
      Top = 88
      Width = 129
      Height = 21
      Date = 43449.704162881940000000
      Time = 43449.704162881940000000
      Color = 9568255
      DateFormat = dfLong
      TabOrder = 3
    end
    object BitBtn1: TBitBtn
      Left = 320
      Top = 16
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = '&Oke'
      Default = True
      TabOrder = 4
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 320
      Top = 112
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = '&Oke'
      Default = True
      TabOrder = 5
      OnClick = BitBtn2Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
end
