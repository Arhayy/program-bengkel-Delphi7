unit mekanik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TFmekanik = class(TForm)
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
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Edit5: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBGrid1: TDBGrid;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit5Enter(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fmekanik: TFmekanik;

implementation

uses datakoneksi;

{$R *.dfm}

procedure TFmekanik.BitBtn1Click(Sender: TObject);
begin
  //jika ada yang kosong maka tampil pesan
  if Edit1.Text ='' then
  begin
    ShowMessage('Kode Mekanik masih kosong, harap diisi');
    Edit2.SetFocus;
    exit;
  end;
  if Edit2.Text ='' then
  begin
    ShowMessage('Nama Mekanik masih kosong, harap diisi');
    Edit2.SetFocus;
    exit;
  end;
  if Edit3.Text ='' then
  begin
    ShowMessage('Alamat masih kosong, harap diisi');
    Edit3.SetFocus;
    exit;
  end;
  if Edit4.Text ='Pilih' then
  begin
    ShowMessage('Nomor Telephon masih kosong, harap diisi');
    Edit4.SetFocus;
    exit;
  end;

  //Proses untuk menyimpan
  DM.ADOCon.Execute('insert into Mekanik(KDmekanik, NMmekanik, '+
  'Almt_mekanik, Telp_mekanik) values ('+QuotedStr(Edit1.Text)+
  ','+QuotedStr(Edit2.text)+','+QuotedStr(Edit3.text)+
  ','+QuotedStr(Edit4.text)+')');

  //Refres data agar langsung tampil dalam program
  DM.QueryMekanik1.Close;
  DM.QueryMekanik1.Open;

  //KOsongkan Form
  Edit1.Text :='';
  Edit2.Text :='';
  Edit3.Text :='';
  Edit4.text :='';

  //Pesan Penyimpanan
  ShowMessage('Data berhasil disimpan');

  //arahkan kursor ke kode barang
  Edit2.SetFocus;

end;

procedure TFmekanik.BitBtn2Click(Sender: TObject);
begin
  //Jika tidak ada datanya, maka tidak ada yg dihapus
  if DM.QueryMekanik1.RecordCount<1 then exit; // agar tidak eror

  //Tambah pesan Hapus ???
  // Ok..
  if Application.MessageBox('Akan menghapus data  ???',' Pesan Konfirmasi',MB_YESNO)=mrNo then exit;

  DM.ADOCon.Execute('delete from Mekanik where KDmekanik='+
  QuotedStr(DM.QueryMekanik1['KDmekanik'])); //ketika id nilainya 001 simulasinya
  // delete from Mekanik where KdBarang = '001'

  //Refresh data
  DM.QueryMekanik1.Close;
  DM.QueryMekanik1.Open;

end;

procedure TFmekanik.BitBtn4Click(Sender: TObject);
begin
  //KOsongkan Form
  Edit1.Text :='';
  Edit2.Text :='';
  Edit3.Text :='';
  Edit4.text :='';
  BitBtn1.Enabled := True;
  BitBtn2.Enabled := True;
  BitBtn3.Enabled := False;
  Edit2.Enabled := True;

end;

procedure TFmekanik.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  edit1.Text := 'KM00' + IntToStr(DM.QueryMekanik1.RecordCount+1);
    if dm.QueryMekanik1.Locate('KDmekanik',edit1.Text, []) = true then
      begin
        edit1.Text := 'KM0' + IntToStr(DM.QueryMekanik1.RecordCount+2);
      end
    else
      begin
        edit1.Text := 'KM00' + IntToStr(DM.QueryMekanik1.RecordCount+1);
      end;
end;

procedure TFmekanik.BitBtn5Click(Sender: TObject);
begin
  edit1.Text := '';
  edit2.Text := '';
  edit3.Text := '';
  edit4.Text := '';
  edit5.Text := '';
  BitBtn1.Enabled := True;
  BitBtn2.Enabled := True;
  BitBtn3.Enabled := False;
  Edit2.Enabled := True;
end;

procedure TFmekanik.FormActivate(Sender: TObject);
begin
  edit2.SetFocus;
  BitBtn3.Enabled := False;
end;

procedure TFmekanik.Edit5Change(Sender: TObject);
begin
  if radiobutton1.Checked then
    begin
      with DM.QueryMekanik1 do
        begin
          close;
          SQL.Clear;
          SQL.Add('select*from Mekanik');
          SQL.Add('where NMmekanik like'''+edit5.Text+'%''');
          ExecSQL;
          Open;
        end;
    end
    else if RadioButton2.Checked then
      with DM.QueryMekanik1 do
        begin
          close;
          SQL.Clear;
          SQL.Add('select*from Mekanik');
          SQL.Add('where KDmekanik like'''+edit5.Text+'%''');
          ExecSQL;
          Open;
        end;
end;

procedure TFmekanik.BitBtn3Click(Sender: TObject);
begin
  BitBtn1.Enabled := True;
  BitBtn2.Enabled := True;
  DM.QueryMekanik1.Edit;
  DM.QueryMekanik1['KDmekanik'] := edit1.Text;
  DM.QueryMekanik1['NMmekanik'] := edit2.Text;
  DM.QueryMekanik1['Almt_mekanik'] := edit3.Text;
  DM.QueryMekanik1['Telp_mekanik'] := edit4.Text;
  DM.QueryMekanik1.Post;
  edit1.text :='';
  edit2.text :='';
  edit3.text :='';
  edit4.text :='';
  BitBtn3.Enabled := False;
  Edit2.Enabled := True;
end;

procedure TFmekanik.DBGrid1DblClick(Sender: TObject);
begin
  edit1.Text := DM.QueryMekanik1['KDmekanik'];
  edit2.Text := DM.QueryMekanik1['NMmekanik'];
  edit3.Text := DM.QueryMekanik1['Almt_mekanik'];
  edit4.Text := DM.QueryMekanik1['Telp_mekanik'];
  BitBtn1.Enabled := False;
  BitBtn2.Enabled := False;
  BitBtn3.Enabled := True;
  Edit2.Enabled := False;
end;

procedure TFmekanik.Edit5Enter(Sender: TObject);
begin
  Edit5.Text := '';
end;

procedure TFmekanik.Edit5Exit(Sender: TObject);
begin
  Edit5.Text := 'Pencarian';
end;

procedure TFmekanik.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in[#13,#8,'0'..'9']) then
    begin
      key := #0;
      Edit4.SetFocus;
      exit;
    end;
end;

end.
