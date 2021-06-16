unit pelanggan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TFpelanggan = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Edit5: TEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit5Enter(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpelanggan: TFpelanggan;

implementation

uses datakoneksi;

{$R *.dfm}

procedure TFpelanggan.BitBtn1Click(Sender: TObject);
begin
  //jika ada yang kosong maka tampil pesan
  if Edit1.Text ='' then
  begin
    ShowMessage('Kode Pelanggan masih kosong, harap diisi');
    Edit2.SetFocus;
    exit;
  end;
  if Edit2.Text ='' then
  begin
    ShowMessage('Nama Pelanggan masih kosong, harap diisi');
    Edit2.SetFocus;
    exit;
  end;
  if Edit3.Text ='' then
  begin
    ShowMessage('Nama Pelanggan masih kosong, harap diisi');
    Edit3.SetFocus;
    exit;
  end;
  if Edit4.Text ='' then
  begin
    ShowMessage('Nama Pelanggan masih kosong, harap diisi');
    Edit4.SetFocus;
    exit;
  end;

  //Proses untuk menyimpan
  DM.ADOCon.Execute('insert into Pelanggan(KDpelanggan, NMpelanggan, '+
  'ALMTpelanggan, No_Telp) values ('+QuotedStr(Edit1.Text)+
  ','+QuotedStr(Edit2.text)+','+QuotedStr(Edit3.text)+','+QuotedStr(Edit4.Text)+')');

  //Refres data agar langsung tampil dalam program
  DM.Querypelanggan1.Close;
  DM.Querypelanggan1.Open;

  //KOsongkan Form
  Edit1.Text :='';
  Edit2.Text :='';
  Edit4.text :='';
  Edit3.text :='';

  //Pesan Penyimpanan
  ShowMessage('Data berhasil disimpan');

  //arahkan kursor ke kode barang
  Edit2.SetFocus;
end;

procedure TFpelanggan.BitBtn4Click(Sender: TObject);
begin
  //Jika tidak ada datanya, maka tidak ada yg dihapus
  if DM.Querypelanggan1.RecordCount<1 then exit; // agar tidak eror

  //Tambah pesan Hapus ???
  // Ok..
  if Application.MessageBox('Akan menghapus data  ???',' Pesan Konfirmasi',MB_YESNO)=mrNo then exit;

  DM.ADOCon.Execute('delete from Pelanggan where KDpelanggan='+
  QuotedStr(DM.Querypelanggan1['KDpelanggan'])); //ketika id nilainya 001 simulasinya
  // delete from Pelanggan where KDpelanggan = '001'

  //Refresh data
  DM.Querypelanggan1.Close;
  DM.Querypelanggan1.Open;
end;

procedure TFpelanggan.BitBtn3Click(Sender: TObject);
begin
  //KOsongkan Form
  Edit1.Text :='';
  Edit2.Text :='';
  Edit4.text :='';
  Edit3.text :='';
  BitBtn1.Enabled := True;
  BitBtn4.Enabled := True;
  BitBtn2.Enabled := False;
  Edit2.Enabled := True;
end;

procedure TFpelanggan.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  edit1.Text := 'KP00' + IntToStr(DM.QueryPelanggan1.RecordCount+1);
    if dm.QueryPelanggan1.Locate('KDpelanggan',edit1.Text, []) = true then
      begin
        edit1.Text := 'KP0' + IntToStr(DM.QueryPelanggan1.RecordCount+2);
      end
    else
      begin
        edit1.Text := 'KP00' + IntToStr(DM.QueryPelanggan1.RecordCount+1);
      end;
end;

procedure TFpelanggan.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in[#13,#8,'0'..'9']) then
    begin
      key := #0;
      Edit4.SetFocus;
      exit;
    end;
end;

procedure TFpelanggan.BitBtn5Click(Sender: TObject);
begin
  edit1.Text := '';
  edit2.Text := '';
  edit3.Text := '';
  edit4.Text := '';
  edit5.Text := '';
  BitBtn1.Enabled := True;
  BitBtn4.Enabled := True;
  BitBtn2.Enabled := False;
  Edit2.Enabled := True;
end;

procedure TFpelanggan.FormActivate(Sender: TObject);
begin
  BitBtn2.Enabled := False;
end;

procedure TFpelanggan.Edit5Change(Sender: TObject);
begin
  with DM.QueryPelanggan1 do
    begin
      close;
      SQL.Clear;
      SQL.Add('select*from Pelanggan');
      SQL.Add('where NMpelanggan like'''+edit5.Text+'%''');
      ExecSQL;
      Open;
    end;
end;

procedure TFpelanggan.BitBtn2Click(Sender: TObject);
begin
  BitBtn1.Enabled := True;
  BitBtn4.Enabled := True;
  DM.QueryPelanggan1.Edit;
  DM.QueryPelanggan1['KDpelanggan'] := edit1.Text;
  DM.QueryPelanggan1['NMpelanggan'] := edit2.Text;
  DM.QueryPelanggan1['ALMTpelanggan'] := edit3.Text;
  DM.QueryPelanggan1['No_Telp'] := edit4.Text;
  DM.QueryPelanggan1.post;
  edit1.text :='';
  edit2.text :='';
  edit3.text :='';
  edit4.text :='';
  BitBtn2.Enabled := False;
  Edit2.Enabled := True;
end;

procedure TFpelanggan.DBGrid1DblClick(Sender: TObject);
begin
  edit1.Text := DM.QueryPelanggan1['KDpelanggan'];
  edit2.Text := DM.QueryPelanggan1['NMpelanggan'];
  edit3.Text := DM.QueryPelanggan1['ALMTpelanggan'];
  edit4.Text := DM.QueryPelanggan1['No_Telp'];
  BitBtn1.Enabled := False;
  BitBtn4.Enabled := False;
  BitBtn2.Enabled := True;
  Edit2.Enabled := False;
end;

procedure TFpelanggan.Edit5Enter(Sender: TObject);
begin
  Edit5.Text := '';
end;

procedure TFpelanggan.Edit5Exit(Sender: TObject);
begin
  Edit5.Text := 'Pencarian';
end;

end.
