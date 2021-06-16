unit barang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TFbarang = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit5: TEdit;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label7: TLabel;
    Edit6: TEdit;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit4: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6Enter(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fbarang: TFbarang;

implementation

uses datakoneksi, ADODB, DB;

{$R *.dfm}

procedure TFbarang.BitBtn1Click(Sender: TObject);
begin
  //jika ada yang kosong maka tampil pesan
  if Edit1.Text ='' then
  begin
    ShowMessage('Kode Barang masih kosong, harap diisi');
    Edit4.SetFocus;
    exit;
  end;
  if Edit4.Text ='' then
  begin
    ShowMessage('Nama Barang masih kosong, harap diisi');
    Edit4.SetFocus;
    exit;
  end;
  if ComboBox1.Text ='Pilih' then
  begin
    ShowMessage('Harus di pilih dulu');
    ComboBox1.SetFocus;
    exit;
  end;

  //Proses untuk menyimpan
  DM.ADOCon.Execute('insert into Barang(KDbarang, NMbarang, '+
  'Hrg_Beli, Hrg_Jual,Jml_Barang,satuan) values ('+
  QuotedStr(Edit1.Text)+','+QuotedStr(Edit4.text)+
  ','+QuotedStr(Edit2.text)+','+QuotedStr(Edit3.Text)+','+
  QuotedStr(Edit5.text)+','+QuotedStr(ComboBox1.text)+')');

  //Refres data agar langsung tampil dalam program
  DM.Querybarang1.Close;
  DM.Querybarang1.Open;

  //KOsongkan Form
  Edit1.Text :='';
  Edit2.Text :='';
  ComboBox1.Text :='';
  Edit4.text :='';
  Edit3.text :='';
  Edit5.text :='';

  //Pesan Penyimpanan
  ShowMessage('Data berhasil disimpan');

end;

procedure TFbarang.FormCreate(Sender: TObject);
begin
  //Menampilkan isi combobox
  combobox1.Items.Add('Botol');
  combobox1.items.Add('Pcs');
end;

procedure TFbarang.BitBtn2Click(Sender: TObject);
begin
  //KOsongkan Form
  Edit1.Text :='';
  Edit2.Text :='';
  ComboBox1.Text :='Pilih';
  Edit4.text :='';
  Edit3.text :='';
  Edit5.text :='';
  BitBtn1.Enabled := True;
  BitBtn3.Enabled := True;
  bitbtn5.Enabled := False;
  Edit4.Enabled := True;
end;

procedure TFbarang.BitBtn3Click(Sender: TObject);
begin
  //Jika tidak ada datanya, maka tidak ada yg dihapus
  if DM.QueryBarang1.RecordCount<1 then exit; // agar tidak eror

  //Tambah pesan Hapus ???
  // Ok..
  if Application.MessageBox('Akan menghapus data  ???',' Pesan Konfirmasi',MB_YESNO)=mrNo then exit;

  DM.ADOCon.Execute('delete from Barang where KDbarang='+
  QuotedStr(DM.QueryBarang1['KDbarang'])); //ketika id nilainya 001 simulasinya
  // delete from Barang where KdBarang = '001'

  //Refresh data
  DM.QueryBarang1.Close;
  DM.QueryBarang1.Open;

end;

procedure TFbarang.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  edit1.Text := 'KB00' + IntToStr(DM.QueryBarang1.RecordCount+1);
    if dm.QueryBarang1.Locate('KDbarang',edit1.Text, []) = true then
      begin
        edit1.Text := 'KB0' + IntToStr(DM.QueryBarang1.RecordCount+2);
      end
    else
      begin
        edit1.Text := 'KB00' + IntToStr(DM.QueryBarang1.RecordCount+1);
      end;
end;

procedure TFbarang.FormActivate(Sender: TObject);
begin
  edit4.SetFocus;
  BitBtn5.Enabled := False;
end;

procedure TFbarang.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#13,#8]) then
    key := #0;
end;

procedure TFbarang.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#13,#8]) then
    key := #0;
end;

procedure TFbarang.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#13,#8]) then
    key := #0;
end;

procedure TFbarang.BitBtn4Click(Sender: TObject);
begin
  edit1.Text := '';
  edit2.Text := '';
  edit3.Text := '';
  edit4.Text := '';
  edit5.Text := '';
  edit6.Text := '';
  ComboBox1.Text := 'Pilih';
  BitBtn1.Enabled := True;
  BitBtn3.Enabled := True;
  bitbtn5.Enabled := False;
  Edit4.Enabled := True;
end;

procedure TFbarang.Edit6Change(Sender: TObject);
begin
  if radiobutton1.Checked then
    begin
      with DM.QueryBarang1 do
        begin
          close;
          SQL.Clear;
          SQL.Add('select*from barang');
          SQL.Add('where NMbarang like'''+edit6.Text+'%''');
          ExecSQL;
          Open;
        end;
    end
    else if RadioButton2.Checked then
      with DM.QueryBarang1 do
        begin
          close;
          SQL.Clear;
          SQL.Add('select*from barang');
          SQL.Add('where KDbarang like'''+edit6.Text+'%''');
          ExecSQL;
          Open;
        end;
end;

procedure TFbarang.DBGrid1DblClick(Sender: TObject);
begin
  edit1.Text := DM.QueryBarang1['KDbarang'];
  edit2.Text := DM.QueryBarang1['Hrg_beli'];
  edit3.Text := DM.QueryBarang1['Hrg_jual'];
  edit4.Text := DM.QueryBarang1['NMbarang'];
  edit5.Text := DM.QueryBarang1['Jml_barang'];
  ComboBox1.Text := DM.QueryBarang1['Satuan'];
  BitBtn1.Enabled := False;
  BitBtn3.Enabled := False;
  BitBtn5.Enabled := True;
  Edit4.Enabled := False;
end;

procedure TFbarang.BitBtn5Click(Sender: TObject);
begin
  BitBtn1.Enabled := True;
  BitBtn3.Enabled := True;
  DM.QueryBarang1.Edit;
  DM.QueryBarang1['KDbarang'] := edit1.Text;
  DM.QueryBarang1['Hrg_beli'] := edit2.Text;
  DM.QueryBarang1['Hrg_jual'] := edit3.Text;
  DM.QueryBarang1['NMbarang'] := edit4.Text;
  DM.QueryBarang1['Jml_barang'] := edit5.Text;
  DM.QueryBarang1['Satuan'] := ComboBox1.Text;
  DM.QueryBarang1.post;
  edit1.text :='';
  edit2.text :='';
  edit3.text :='';
  edit4.text :='';
  edit5.text :='';
  combobox1.text := 'Pilih';
  BitBtn5.Enabled := False;
  Edit4.Enabled := True;
end;

procedure TFbarang.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TFbarang.Edit6Enter(Sender: TObject);
begin
 Edit6.Text := '';
end;

procedure TFbarang.Edit6Exit(Sender: TObject);
begin
  Edit6.Text := 'Pencarian';
end;

procedure TFbarang.FormShow(Sender: TObject);
begin
  DM.QueryBarang1.SQL.Clear;
  DM.QueryBarang1.SQL.Add('select*from Barang');
  DM.QueryBarang1.Open;
end;

end.
