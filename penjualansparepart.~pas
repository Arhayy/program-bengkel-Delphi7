unit penjualansparepart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, ComCtrls, Buttons;

type
  TFpenjualansparepart = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Shape2: TShape;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit7: TEdit;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Button3: TButton;
    DTP1: TDateTimePicker;
    Shape1: TShape;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Edit6: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Button4: TButton;
    Image1: TImage;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Shape3: TShape;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure Button3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit13KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Button5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpenjualansparepart: TFpenjualansparepart;

implementation

uses datakoneksi, carikodebarang, caridatabarang, menu, NotaSparepart;

{$R *.dfm}

procedure TFpenjualansparepart.Button3Click(Sender: TObject);
begin
  DM.QuerySparepart1.Open;
  Edit5.Text:=FormatDateTime('yy.mm.dd-hh.nn.ss',Now);
  //edit5.Text := FormatDateTime('yyMMdd',DTP1.Date)+'-U-000' + IntToStr(DM.QuerySparePart1.RecordCount +1);
  edit6.Enabled := true;
  edit13.Enabled := true;
  edit6.SetFocus;
end;

procedure TFpenjualansparepart.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    DM.QueryPelanggan1.Close;
    DM.QueryPelanggan1.SQL.Clear;
    DM.QueryPelanggan1.SQL.Add('SELECT * FROM Pelanggan WHERE KDpelanggan = '+QuotedStr(edit1.Text)+'');
    DM.QueryPelanggan1.Open;
      if DM.QueryPelanggan1.RecordCount <> 0 then
        begin
          edit2.Text := DM.QueryPelanggan1['NMpelanggan'];
        end;
          DM.QueryPelanggan1.Close;
          DM.QueryPelanggan1.SQL.Clear;
          DM.QueryPelanggan1.SQL.Add('SELECT * FROM Pelanggan');
          DM.QueryPelanggan1.Open;
end;

procedure TFpenjualansparepart.Button4Click(Sender: TObject);
begin
Cdatabarang.ShowModal;
end;

procedure TFpenjualansparepart.Edit6KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    DM.QueryBarang1.Close;
    DM.QueryBarang1.SQL.Clear;
    DM.QueryBarang1.SQL.Add('SELECT * FROM Barang WHERE KDbarang = '+QuotedStr(edit6.Text)+'');
    DM.QueryBarang1.Open;
      if DM.QueryBarang1.RecordCount <> 0 then
        begin
          edit11.Text := DM.QueryBarang1['NMbarang'];
          edit12.Text := DM.QueryBarang1['Hrg_Jual'];
          edit13.SetFocus;
        end;
          DM.QueryBarang1.Close;
          DM.QueryBarang1.SQL.Clear;
          DM.QueryBarang1.SQL.Add('SELECT * FROM Barang');
          DM.QueryBarang1.Open;
end;

procedure TFpenjualansparepart.Edit13KeyPress(Sender: TObject;
  var Key: Char);
var
  a, b, c : integer;
begin
  if not (key in['0'..'9',#13,#8]) then
    key := #0;
      if not(key=chr(13)) then
      exit;
        if DM.QueryBarang1['Jml_barang'] < StrToInt(edit13.Text) then
          begin
            ShowMessage('Stok Tidak Cukup');
            exit;
          end
        else
          a := Strtoint(edit12.Text);
          b := strtoint(edit13.Text);
          c := a*b;
          edit14.Text := IntToStr(c);
end;

procedure TFpenjualansparepart.Edit9KeyPress(Sender: TObject;
  var Key: Char);
var
  a, b, c : integer;
begin
if not (key in['0'..'9',#13,#8]) then
  key := #0;
  if key =#13 then
    begin
      a := StrToInt(edit9.Text);
      b := StrToInt(label6.Caption);
      c := a - b;
        if b <= a then
          edit10.Text := IntToStr(c);
    end
end;

procedure TFpenjualansparepart.Button5Click(Sender: TObject);
begin
  if DM.CDSsparepart1.RecordCount<1 then exit else
  begin
    DM.CDSsparepart1.Delete;
  end;
end;

procedure TFpenjualansparepart.FormActivate(Sender: TObject);
begin
  Edit7.Text := Fmenu.StatusBar1.Panels[1].Text
end;

procedure TFpenjualansparepart.BitBtn1Click(Sender: TObject);
  var i:integer;
begin
  if edit5.Text ='' then
    begin
      ShowMessage('Silahkan klik mulai untuk mengisi faktur');
      Button3.SetFocus;
      exit;
    end;
  if edit9.Text ='' then
    begin
      ShowMessage('Transaksi Belum Selesai');
      edit9.SetFocus;
      exit;
    end;

    DM.ADOCon.Execute('insert into Penjualan (Faktur,Tanggal,Total,Dibayar,Kembali,KDkasir,KDpelanggan)'+
    'values ('+QuotedStr(Edit5.Text)+','+QuotedStr(FormatDateTime('mm/dd/yyyy',DTP1.Date))+','+
    QuotedStr(Label6.Caption)+','+quotedstr(Edit9.text)+
    ','+QuotedStr(Edit10.text)+','+QuotedStr(Edit7.Text)+','+QuotedStr(Edit1.Text)+')');

      for i:=1 to DM.CDSsparepart1.RecordCount do
        begin
          DM.CDSsparepart1.RecNo:=i;
          DM.ADOCon.Execute('insert into DetailJual (Faktur,KDbarang,NMbarang,Hrg_Jual,Jumlah,SubTotal) values '+
          ' ('+QuotedStr(Edit5.Text)+','+QuotedStr(DM.CDSsparepart1['KDbarang'])+','+QuotedStr(DM.CDSsparepart1['NMbarang'])+
          ','+FloatToStr(DM.CDSsparepart1['Harga'])+','+FloatToStr(DM.CDSsparepart1['Jumlah'])+','+FloatToStr(DM.CDSsparepart1['SubTotal'])+') ');

          DM.ADOCon.Execute('update Barang set jml_barang=jml_barang-'+FloatToStr(DM.CDSsparepart1['jumlah'])+
          ' where KDbarang='+quotedstr(DM.CDSsparepart1['KDbarang']));
        end;
          ShowMessage('Transaksi selesai');
          DM.CDSsparepart1.Close;
          DM.CDSsparepart1.CreateDataSet;
          Label6.Caption :='0';
          Edit5.Enabled := False;
          Edit8.Text :='';
          Edit9.Text :='';
          Edit10.Text :='';
          Edit6.Enabled := False;
          Edit9.Enabled := False;
          Edit13.Enabled := False;
end;

procedure TFpenjualansparepart.BitBtn2Click(Sender: TObject);
begin
  DM.QueryRsparepart2.SQL.Clear;
  DM.QueryRsparepart2.SQL.Add('select*from DetailJual where faktur='+QuotedStr(edit5.Text)+'');
  DM.QueryRsparepart2.Open;

  DM.QueryRsparepart1.SQL.Clear;
  DM.QueryRsparepart1.SQL.Add('select*from Penjualan where faktur='+QuotedStr(edit5.Text)+'');
  DM.QueryRsparepart1.Open;
  NotaSpareepart.Preview;
  Edit5.Text :='';
  Edit1.Text := 'U-1';
  Edit2.Text := 'Umum';
end;

procedure TFpenjualansparepart.BitBtn3Click(Sender: TObject);
begin
  DM.CDSsparepart1.Close;
  DM.CDSsparepart1.CreateDataSet;
  Edit1.Text := 'U-1';
  Edit2.Text := 'Umum';
  Edit5.Text :='';
  Edit6.Text :='';
  Edit11.Text :='';
  Edit12.Text :='';
  Edit14.Text :='';
  Edit8.Text :='';
  Edit9.Text :='';
  Edit10.Text :='';
  Label6.Caption :='0';
  Edit6.Enabled := false;
  Edit13.Enabled := false;
  Edit9.Enabled := false;
end;

procedure TFpenjualansparepart.BitBtn4Click(Sender: TObject);
begin
  if edit5.Text ='' then
    begin
      ShowMessage('Silahkan klik ceklik untuk isi faktur');
      exit;
    end;
    if Edit6.text ='' then
    begin
      ShowMessage('Silahkan isikan kode barang dengan benar');
      exit;
    end;
    if Edit14.text ='0' then
    begin
      ShowMessage('Silahkan isikan jumlah barang dulu, lalu enter !');
      exit;
    end;

  DM.CDSsparepart1.Append;
  DM.CDSsparepart1['KDbarang']:=Edit6.Text;
  DM.CDSsparepart1['NMbarang']:=Edit11.Text;
  DM.CDSsparepart1['harga']:=Edit12.text;
  DM.CDSsparepart1['jumlah']:=Edit13.text;
  DM.CDSsparepart1['subtotal']:=(DM.CDSsparepart1['Harga']*DM.CDSsparepart1['Jumlah']);
  DM.CDSsparepart1.Post;
  edit6.SetFocus;
  Edit6.Text:='';
  Edit11.Text:='';
  Edit12.text:='';
  Edit13.text:='';
  Edit14.text:='';

  if DM.CDSsparepart1.RecordCount>0 then
    begin
      Edit8.text:= DM.CDSsparepart1.Aggregates[0].Value;
      label6.caption:= DM.CDSsparepart1.Aggregates[1].Value;
    end;
      Edit9.Enabled := True;
end;

procedure TFpenjualansparepart.FormCreate(Sender: TObject);
begin
  DTP1.Date := now;
end;

procedure TFpenjualansparepart.Button1Click(Sender: TObject);
begin
  if DM.CDSsparepart1.RecordCount<1 then exit else
  begin
    DM.CDSsparepart1.Delete;
    if DM.CDSsparepart1.RecordCount>0 then
    begin
      Edit8.text:=DM.CDSsparepart1.Aggregates[0].Value;
      label6.caption:= DM.CDSsparepart1.Aggregates[1].Value;
    end;
  end;
end;

procedure TFpenjualansparepart.BitBtn5Click(Sender: TObject);
begin
  if DM.CDSsparepart1.RecordCount<1 then exit else
  begin
    DM.CDSsparepart1.Delete;
    if DM.CDSsparepart1.RecordCount>0 then
    begin
      Edit8.text:=DM.CDSsparepart1.Aggregates[0].Value;
      label6.caption:= DM.CDSsparepart1.Aggregates[1].Value;
    end;
  end;
end;

end.
