unit daftarservice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, Buttons;

type
  TFpendaftarservice = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit7: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DTP: TDateTimePicker;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpendaftarservice: TFpendaftarservice;

implementation

uses datakoneksi, DB, Rnomordaftar;

{$R *.dfm}

procedure TFpendaftarservice.Button1Click(Sender: TObject);
begin
  //edit1.Text := FormatDateTime('yyMMdd',DTP.Date)+'-000' + IntToStr(dm.QueryDaftarService1.RecordCount +1);
  Edit1.Text:=FormatDateTime('yymmdd-hhnnss',Now);
end;

procedure TFpendaftarservice.BitBtn1Click(Sender: TObject);
begin
  //jika ada yang kosong maka tampil pesan
  if Edit1.Text ='' then
  begin
    ShowMessage('Nomor pendaftaran masih kosong, harap diisi');
    Edit2.SetFocus;
    exit;
  end;
  if Edit2.Text ='' then
  begin
    ShowMessage('Nomor Polisi masih kosong, harap diisi');
    Edit2.SetFocus;
    exit;
  end;
  if edit3.Text ='Pilih' then
  begin
    ShowMessage('Nama pemilik masih kosong, harap diisi');
    edit3.SetFocus;
    exit;
  end;
  if edit6.Text ='Pilih' then
  begin
    ShowMessage('Jenis kendaraan masih kosong, harap diisi');
    edit6.SetFocus;
    exit;
  end;
  if edit4.Text ='Pilih' then
  begin
    ShowMessage('Keluhan masih kosong, harap diisi');
    edit4.SetFocus;
    exit;
  end;

  //Proses untuk menyimpan
  DM.ADOCon.Execute('insert into Pendaftaran(Nomor, Tanggal, '+
  'NoPol, Nama, Kendaraan, Keluhan) values ('+
  QuotedStr(Edit1.Text)+','+QuotedStr(FormatDateTime('mm/dd/yyyy',DTP.Date))+
  ','+QuotedStr(Edit2.text)+','+QuotedStr(Edit3.Text)+','+
  QuotedStr(Edit6.text)+','+QuotedStr(edit4.text)+')');

  //Refres data agar langsung tampil dalam program
  DM.QueryDaftarService1.Close;
  DM.QueryDaftarService1.Open;

  //KOsongkan Form
  Edit2.Text :='';
  Edit4.text :='';
  Edit3.text :='';
  edit6.Text :='';

  //Pesan Penyimpanan
  ShowMessage('Data berhasil disimpan');

  DM.QueryDaftarService1.SQL.Clear;
  DM.QueryDaftarService1.SQL.Add('select*from Pendaftaran where Nomor='+QuotedStr(edit1.Text)+'');
  DM.QueryDaftarService1.Open;
  RNdaftar.Preview;
  DM.QueryDaftarService1.SQL.Clear;
  DM.QueryDaftarService1.SQL.Add('select*from Pendaftaran'); 
  DM.QueryDaftarService1.Open;
  Edit1.Text :='';

  //arahkan kursor ke kode barang
  Edit2.SetFocus;
end;

procedure TFpendaftarservice.BitBtn2Click(Sender: TObject);
begin
  //Jika tidak ada datanya, maka tidak ada yg dihapus
  if DM.QueryDaftarService1.RecordCount<1 then exit; // agar tidak eror

  //Tambah pesan Hapus ???
  // Ok..
  if Application.MessageBox('Akan menghapus data  ???',' Pesan Konfirmasi',MB_YESNO)=mrNo then exit;

  DM.ADOCon.Execute('delete from Pendaftaran where Nomor='+
  QuotedStr(DM.QueryDaftarService1['Nomor'])); //ketika id nilainya 001 simulasinya
  // delete from Nomor where Nomor

  //Refresh data
  DM.QueryDaftarService1.Close;
  DM.QueryDaftarService1.Open;
end;

procedure TFpendaftarservice.BitBtn3Click(Sender: TObject);
begin
  edit2.SetFocus;
  //KOsongkan Form
  Edit1.Text :='';
  Edit2.Text :='';
  Edit4.text :='';
  Edit3.text :='';
  edit6.Text :='';
end;

procedure TFpendaftarservice.BitBtn4Click(Sender: TObject);
begin
  edit2.SetFocus;
  //KOsongkan Form
  Edit1.Text :='';
  Edit2.Text :='';
  Edit4.text :='';
  Edit3.text :='';
  edit6.Text :='';
  edit7.Text :='';
end;

procedure TFpendaftarservice.FormActivate(Sender: TObject);
begin
  edit2.SetFocus;
end;

procedure TFpendaftarservice.Edit7Change(Sender: TObject);
begin
  if radiobutton1.Checked then
    begin
      with DM.QueryDaftarService1 do
        begin
          close;
          SQL.Clear;
          SQL.Add('select*from Pendaftaran');
          SQL.Add('where Nama like'''+edit7.Text+'%''');
          ExecSQL;
          Open;
        end;
    end
    else if RadioButton2.Checked then
      with DM.QueryDaftarService1 do
        begin
          close;
          SQL.Clear;
          SQL.Add('select*from Pendaftaran');
          SQL.Add('where NoPol like'''+edit7.Text+'%''');
          ExecSQL;
          Open;
        end;
end;

procedure TFpendaftarservice.FormCreate(Sender: TObject);
begin
  DTP.Date := now;
end;

end.
