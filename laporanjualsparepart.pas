unit laporanjualsparepart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TFlaporanjualsparepart = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Shape1: TShape;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    DTPawal: TDateTimePicker;
    Label5: TLabel;
    DTPakhir: TDateTimePicker;
    BitBtn1: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DTPawalChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flaporanjualsparepart: TFlaporanjualsparepart;

implementation

uses datakoneksi,Reportbulanansparepart, dateutils, NotaSparepart;

{$R *.dfm}

procedure TFlaporanjualsparepart.BitBtn2Click(Sender: TObject);
var Sintak:String;
begin
  if ComboBox1.ItemIndex=0 then
    Begin
      Sintak:= 'SELECT * from Penjualan where Tanggal>=#'+FormatDateTime('yyyy/MM/dd',DTPawal.Date)+'# and Tanggal<=#'+FormatDateTime('yyyy/MM/dd',DTPakhir.Date)+'#'
    end
  else
  if ComboBox1.ItemIndex=1 then
    Begin
      Sintak:= 'SELECT * from Penjualan where Month(Tanggal)='+FormatDateTime('MM',DTPawal.Date)+' and year(Tanggal)='+FormatDateTime('yyyy',DTPawal.Date)+''
    end
  else
    Begin
      Sintak:= 'SELECT * from Penjualan where Year(Tanggal)='+FormatDateTime('yyyy',DTPawal.Date)+''
    end;

      DM.RSparepart1.Close;
      DM.RSparepart1.SQL.Clear;
      DM.RSparepart1.SQL.Add(Sintak);
      DM.RSparepart1.Open;

    if not DM.RSparepart1.Eof then
      Freportsparepart.Preview
    else
      MessageDlg('Data Tidak Ditemukan ',mtError,[mbOK],0)
end;

procedure TFlaporanjualsparepart.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex=0 then
    Begin
      DTPawal.Format:='dd MMM yyy';
      Label5.Visible:=True;
      DTPakhir.Visible:=True;
    end
  else
  if ComboBox1.ItemIndex=1 then
    Begin
      DTPawal.Format:='MMMM yyyy';
      Label5.Visible:=False;
      DTPakhir.Visible:=False;
  end
  else
    Begin
      DTPawal.Format:='yyyy';
      DTPakhir.Visible:=False;
      Label5.Visible:=False;
    end
end;

procedure TFlaporanjualsparepart.FormShow(Sender: TObject);
begin
  ComboBox1.ItemIndex:=0;
  DTPawal.Date:=StartOfTheMonth(now);
  DTPakhir.Date:=EndOfTheMonth(now)
end;

procedure TFlaporanjualsparepart.DTPawalChange(Sender: TObject);
begin
  DTPakhir.Date:=EndOfTheMonth(DTPawal.Date)
end;

procedure TFlaporanjualsparepart.BitBtn1Click(Sender: TObject);
begin
  DM.QueryRsparepart2.SQL.Clear;
  DM.QueryRsparepart2.SQL.Add('select*from DetailJual where faktur='+QuotedStr(edit1.Text)+'');
  DM.QueryRsparepart2.Open;

  DM.QueryRsparepart1.SQL.Clear;
  DM.QueryRsparepart1.SQL.Add('select*from Penjualan where faktur='+QuotedStr(edit1.Text)+'');
  DM.QueryRsparepart1.Open;
  NotaSpareepart.Preview;
  Edit1.Text :='';
end;

procedure TFlaporanjualsparepart.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  key:=#0
end;

end.
