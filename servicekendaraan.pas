unit servicekendaraan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, MidasLib,
  Buttons;

type
  TFservicekendaraan = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    Shape2: TShape;
    Label16: TLabel;
    Label17: TLabel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Shape1: TShape;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit7: TEdit;
    Button1: TButton;
    Edit8: TEdit;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    DTP1: TDateTimePicker;
    Edit1: TEdit;
    Edit14: TEdit;
    DBEdit1: TDBEdit;
    KDmekanik: TDBLookupComboBox;
    Shape3: TShape;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Edit6: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Image1: TImage;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit14KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit17KeyPress(Sender: TObject; var Key: Char);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure KDmekanikKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
  private
    procedure jumlahin;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fservicekendaraan: TFservicekendaraan;

implementation

uses datakoneksi, carikodejasa, carikodebarang, menu, ReportNota;

{$R *.dfm}

procedure Tfservicekendaraan.jumlahin;
var
  a, b, c : integer;
begin
  a := StrToInt(edit8.Text);
  b := StrToInt(edit10.Text);
  c := a+b;
  edit11.Text := IntToStr(c);
  label17.caption := IntToStr(c);
end;

procedure TFservicekendaraan.Button1Click(Sender: TObject);
begin
Ckodejasa.ShowModal;
end;

procedure TFservicekendaraan.Button2Click(Sender: TObject);
begin
Ckodebarang.ShowModal;
end;

procedure TFservicekendaraan.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    DM.QueryDaftarService1.Close;
    DM.QueryDaftarService1.SQL.Clear;
    DM.QueryDaftarService1.SQL.Add('SELECT * FROM Pendaftaran WHERE Nomor = '+QuotedStr(edit1.Text)+'');
    DM.QueryDaftarService1.Open;
      if DM.QueryDaftarService1.RecordCount <> 0 then
        begin
          edit2.Text := DM.QueryDaftarService1['NoPol'];
          edit3.Text := DM.QueryDaftarService1['Kendaraan'];
          edit4.Text := DM.QueryDaftarService1['Nama'];
          edit5.Text := DM.QueryDaftarService1['Keluhan'];
        end;
          DM.QueryDaftarService1.Close;
          DM.QueryDaftarService1.SQL.Clear;
          DM.QueryDaftarService1.SQL.Add('SELECT * FROM Pendaftaran');
          DM.QueryDaftarService1.Open;

end;

procedure TFservicekendaraan.Edit14KeyPress(Sender: TObject;
  var Key: Char);
var
  a,b,c : integer;
begin
  if key=#13 then
    DM.QueryJasa1.Close;
    DM.QueryJasa1.SQL.Clear;
    DM.QueryJasa1.SQL.Add('SELECT * FROM Jasa WHERE KDjasa = '+QuotedStr(edit14.Text)+'');
    DM.QueryJasa1.Open;
      if DM.QueryJasa1.RecordCount <> 0 then
        begin
          edit7.Text := DM.QueryJasa1['NMjasa'];
          edit8.Text := DM.QueryJasa1['Harga'];
          edit6.SetFocus;
        end;
          DM.QueryJasa1.Close;
          DM.QueryJasa1.SQL.Clear;
          DM.QueryJasa1.SQL.Add('SELECT * FROM Jasa');
          DM.QueryJasa1.Open;

  a := StrToInt(edit8.Text);
  b := StrToInt(edit10.Text);
  c := a+b;
  edit11.Text := IntToStr(c);
  label17.caption := IntToStr(c);
  Edit6.Enabled := True;
  Edit12.Enabled := True;

end;

procedure TFservicekendaraan.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    DM.QueryBarang1.Close;
    DM.QueryBarang1.SQL.Clear;
    DM.QueryBarang1.SQL.Add('SELECT * FROM Barang WHERE KDbarang = '+QuotedStr(edit6.Text)+'');
    DM.QueryBarang1.Open;
      if DM.QueryBarang1.RecordCount <> 0 then
        begin
          edit15.Text := DM.QueryBarang1['NMbarang'];
          edit16.Text := DM.QueryBarang1['Hrg_Jual'];
          edit17.SetFocus;
        end;
          DM.QueryBarang1.Close;
          DM.QueryBarang1.SQL.Clear;
          DM.QueryBarang1.SQL.Add('SELECT * FROM Barang');
          DM.QueryBarang1.Open;
          Edit17.Enabled := True;
end;

procedure TFservicekendaraan.Edit17KeyPress(Sender: TObject;
  var Key: Char);
var
  a, b, c : integer;
begin
  if not (key in['0'..'9',#13,#8]) then
    key := #0;
      if not(key=chr(13)) then
      exit;
        if DM.QueryBarang1['Jml_barang'] < StrToInt(Edit17.Text) then
          begin
            ShowMessage('Stok Tidak Cukup');
            exit;
          end
        else
          a := Strtoint(edit16.Text);
          b := strtoint(edit17.Text);
          c := a*b;
          edit18.Text := IntToStr(c);
end;

procedure TFservicekendaraan.Edit12KeyPress(Sender: TObject;
  var Key: Char);
var
  a, b, c : integer;
begin
if not (key in['0'..'9',#13,#8]) then
  key := #0;
  if key =#13 then
    begin
      a := StrToInt(edit11.Text);
      b := StrToInt(edit12.Text);
      c := b - a;
        if a <= b then
          edit13.Text := IntToStr(c);
    end
end;

procedure TFservicekendaraan.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus;
  DBedit1.Text :='';
end;

procedure TFservicekendaraan.BitBtn3Click(Sender: TObject);
begin
  DM.QueryRservice2.SQL.Clear;
  DM.QueryRservice2.SQL.Add('select*from DetailService where faktur='+QuotedStr(edit1.Text)+'');
  DM.QueryRservice2.Open;

  DM.QueryRservice1.SQL.Clear;
  DM.QueryRservice1.SQL.Add('select*from Service where faktur='+QuotedStr(edit1.Text)+'');
  DM.QueryRservice1.Open;
  NotaService.Preview;
  Edit1.Text :='';
  Edit1.Enabled := true;
end;

procedure TFservicekendaraan.BitBtn1Click(Sender: TObject);
  var i:integer;
begin
    if edit1.Text ='' then
    begin
      ShowMessage('Faktur/nomor pendaftaran masih kosong');
      exit;
    end;
    if DBedit1.Text ='' then
    begin
      ShowMessage('Transaksi belum selesai !');
      exit;
    end;
    if edit13.Text ='' then
    begin
      ShowMessage('Teransaksi belum selesai !');
      exit;
    end;

    DM.ADOCon.Execute('insert into Service (Faktur,Tanggal,KDjasa,NMjasa,BiayaJasa,Jml_item,BiayaBarang,Jml_total,Dibayar,Kembali,KDkasir,NoPol,KDmekanik)'+
    'values ('+QuotedStr(Edit1.Text)+','+QuotedStr(FormatDateTime('mm/dd/yyyy',DTP1.Date))+','+
    QuotedStr(Edit14.Text)+','+quotedstr(Edit7.text)+','+QuotedStr(Edit8.text)+
    ','+QuotedStr(Edit9.text)+','+QuotedStr(Edit10.Text)+','+QuotedStr(Label17.Caption)+
    ','+QuotedStr(Edit12.Text)+','+QuotedStr(Edit13.Text)+','+QuotedStr(Fmenu.StatusBar1.Panels[1].Text)+
    ','+QuotedStr(Edit2.Text)+','+QuotedStr(KDmekanik.Text)+')');

      for i:=1 to DM.CDSservice1.RecordCount do
        begin
          DM.CDSservice1.RecNo:=i;
          DM.ADOCon.Execute('insert into DetailService (Faktur,KDbarang,NMbarang,Hrg_Jual,Jml_Jual,Subtotal) values '+
          ' ('+QuotedStr(Edit1.Text)+','+QuotedStr(DM.CDSservice1['KDbarang'])+','+QuotedStr(DM.CDSservice1['NMbarang'])+
          ','+FloatToStr(DM.CDSservice1['Harga'])+','+FloatToStr(DM.CDSservice1['Jumlah'])+','+FloatToStr(DM.CDSservice1['SubTotal'])+') ');

          DM.ADOCon.Execute('update Barang set jml_barang=jml_barang-'+FloatToStr(DM.CDSservice1['jumlah'])+
          ' where KDbarang='+quotedstr(DM.CDSservice1['KDbarang']));
        end;
          ShowMessage('Transaksi selesai');
          DM.CDSservice1.Close;
          DM.CDSservice1.CreateDataSet;
          DBedit1.Text :='';
          Edit1.Enabled := false;
          Edit2.Text :='';
          Edit3.Text :='';
          Edit4.Text :='';
          Edit5.Text :='';
          Edit7.Text :='';
          Edit8.Text :='0';
          Edit9.Text :='';
          Edit10.Text :='0';
          Edit11.Text :='';
          Edit12.Text :='';
          Edit13.Text :='';
          Edit14.Text :='';
          Label17.Caption :='0';
          Edit1.Enabled := False;
          Edit6.Enabled := False
end;

procedure TFservicekendaraan.BitBtn4Click(Sender: TObject);
begin
  if edit6.Text ='' then
    begin
      ShowMessage('Silahkan isikan ID Barang dengan benar');
      exit;
    end;
    if Edit18.text ='0' then
    begin
      ShowMessage('Silahkan isikan jumlah barang dengan benar');
      exit;
    end;
  DM.CDSservice1.Append;
  DM.CDSservice1['KDbarang']:=Edit6.Text;
  DM.CDSservice1['NMbarang']:=Edit15.Text;
  DM.CDSservice1['harga']:=Edit16.text;
  DM.CDSservice1['jumlah']:=Edit17.text;
  DM.CDSservice1['subtotal']:=(DM.CDSservice1['Harga']*DM.CDSservice1['Jumlah']);
  DM.CDSservice1.Post;
  Edit6.Text:='';
  Edit15.Text:='';
  Edit16.text:='';
  Edit17.text:='';
  Edit18.text:='';
  edit6.SetFocus;

  if DM.CDSservice1.RecordCount>0 then
  begin
    Edit10.text:= DM.CDSservice1.Aggregates[0].Value;
    Edit9.text:= DM.CDSservice1.Aggregates[1].Value;
  end;

  jumlahin;

end;

procedure TFservicekendaraan.BitBtn2Click(Sender: TObject);
begin
  DM.CDSservice1.Close;
  DM.CDSservice1.CreateDataSet;
  Edit1.Text :='';
  DBedit1.Text :='';
  Edit2.Text :='';
  Edit3.Text :='';
  Edit4.Text :='';
  Edit5.Text :='';
  Edit14.Text :='';
  Edit14.Enabled := True;
  Edit7.Text :='';
  Label17.Caption :='0';
  Edit8.Text :='0';
  Edit6.Text :='';
  Edit6.Enabled := false;
  Edit15.Text :='';
  Edit16.Text :='';
  Edit17.Text :='';
  Edit17.Enabled := False;
  Edit18.Text :='';
  Edit9.Text :='';
  Edit10.Text :='0';
  Edit11.Text :='';
  Edit12.Text :='';
  Edit12.Enabled := false;
  Edit13.Text :='';


end;

procedure TFservicekendaraan.FormCreate(Sender: TObject);
begin
  DTP1.Date := now;
end;

procedure TFservicekendaraan.KDmekanikKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := #0;
end;

procedure TFservicekendaraan.BitBtn5Click(Sender: TObject);
begin
  if DM.CDSservice1.RecordCount<1 then exit else
  begin
    DM.CDSservice1.Delete;
    if DM.CDSservice1.RecordCount>0 then
    begin
      Edit10.text:= DM.CDSservice1.Aggregates[0].Value;
      Edit9.text:= DM.CDSservice1.Aggregates[1].Value;
      jumlahin;
    end;
  end;
end;

end.
