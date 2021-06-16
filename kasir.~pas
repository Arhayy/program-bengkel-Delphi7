unit kasir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TFkasir = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label5: TLabel;
    Edit4: TEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit4Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fkasir: TFkasir;

implementation

uses datakoneksi;

{$R *.dfm}

procedure TFkasir.BitBtn1Click(Sender: TObject);
begin
  //jika ada yang kosong maka tampil pesan
  if Edit1.Text ='' then
  begin
    ShowMessage('Kode Kasir masih kosong, harap diisi');
    Edit2.SetFocus;
    exit;
  end;
  if Edit2.Text ='' then
  begin
    ShowMessage('Nama Kasir masih kosong, harap diisi');
    Edit2.SetFocus;
    exit;
  end;
  if Edit3.Text ='' then
  begin
    ShowMessage('Nama Kasir masih kosong, harap diisi');
    Edit3.SetFocus;
    exit;
  end;
  if ComboBox1.Text ='Pilih' then
  begin
    ShowMessage('Harus di pilih dulu');
    ComboBox1.SetFocus;
    exit;
  end;

  //Proses untuk menyimpan
  DM.ADOCon.Execute('insert into Kasir(KDkasir, NMkasir, '+
  'PWkasir, STTSkasir) values ('+QuotedStr(Edit1.Text)+
  ','+QuotedStr(Edit2.text)+','+QuotedStr(Edit3.text)+
  ','+QuotedStr(ComboBox1.text)+')');

  //Refres data agar langsung tampil dalam program
  DM.Querykasir1.Close;
  DM.Querykasir1.Open;

  //KOsongkan Form
  Edit1.Text :='';
  Edit2.Text :='';
  ComboBox1.Text :='';
  Edit3.text :='';

  //Pesan Penyimpanan
  ShowMessage('Data berhasil disimpan');

  //arahkan kursor ke kode barang
  Edit2.SetFocus;

end;

procedure TFkasir.FormCreate(Sender: TObject);
begin
  //Mengisi combobox
 combobox1.Items.Add('Kasir');

end;

procedure TFkasir.BitBtn3Click(Sender: TObject);
begin
  //Jika tidak ada datanya, maka tidak ada yg dihapus
  if DM.QueryKasir1.RecordCount<1 then exit; // agar tidak eror

  //Tambah pesan Hapus ???
  // Ok..
  if Application.MessageBox('Akan menghapus data  ???',' Pesan Konfirmasi',MB_YESNO)=mrNo then exit;

  DM.ADOCon.Execute('delete from Kasir where KDkasir='+
  QuotedStr(DM.QueryKasir1['KDkasir'])); //ketika id nilainya 001 simulasinya
  // delete from Kasir where KdBarang = '001'

  //Refresh data
  DM.QueryKasir1.Close;
  DM.QueryKasir1.Open;

end;

procedure TFkasir.BitBtn2Click(Sender: TObject);
begin
  //KOsongkan Form
  Edit1.Text :='';
  Edit2.Text :='';
  ComboBox1.Text :='Pilih';
  Edit3.text :='';
  BitBtn1.Enabled := True;
  BitBtn3.Enabled := True;
  BitBtn5.Enabled := False;
  Edit2.Enabled := True;

end;

procedure TFkasir.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  edit1.Text := 'KSR0' + IntToStr(DM.QueryKasir1.RecordCount+1);
    if dm.QueryKasir1.Locate('KDkasir',edit1.Text, []) = true then
      begin
        edit1.Text := 'KSR' + IntToStr(DM.QueryKasir1.RecordCount+2);
      end
    else
      begin
        edit1.Text := 'KSR0' + IntToStr(DM.QueryKasir1.RecordCount+1);
      end;
end;

procedure TFkasir.BitBtn4Click(Sender: TObject);
begin
  edit1.Text := '';
  edit2.Text := '';
  edit3.Text := '';
  edit4.Text := '';
  ComboBox1.Text := 'Pilih';
  BitBtn1.Enabled := True;
  BitBtn3.Enabled := True;
  BitBtn5.Enabled := False;
  Edit2.Enabled := True;
end;

procedure TFkasir.FormActivate(Sender: TObject);
begin
  edit2.SetFocus;
  BitBtn5.Enabled := False;
end;

procedure TFkasir.Edit4Change(Sender: TObject);
begin
  if radiobutton1.Checked then
    begin
      with DM.QueryKasir1 do
        begin
          close;
          SQL.Clear;
          SQL.Add('select*from Kasir');
          SQL.Add('where NMkasir like'''+edit4.Text+'%''');
          ExecSQL;
          Open;
        end;
    end
    else if RadioButton2.Checked then
      with DM.QueryKasir1 do
        begin
          close;
          SQL.Clear;
          SQL.Add('select*from Kasir');
          SQL.Add('where KDkasir like'''+edit4.Text+'%''');
          ExecSQL;
          Open;
        end;
end;

procedure TFkasir.BitBtn5Click(Sender: TObject);
begin
  BitBtn1.Enabled := True;
  BitBtn3.Enabled := True;
  DM.QueryKasir1.Edit;
  DM.QueryKasir1['KDkasir'] := edit1.Text;
  DM.QueryKasir1['NMkasir'] := edit2.Text;
  DM.QueryKasir1['PWkasir'] := edit3.Text;
  DM.QueryKasir1['STTSkasir'] := ComboBox1.Text;
  DM.QueryKasir1.post;
  edit1.text :='';
  edit2.text :='';
  edit3.text :='';
  combobox1.text := 'Pilih';
  BitBtn5.Enabled := False;
  Edit2.Enabled := True;
end;

procedure TFkasir.DBGrid1DblClick(Sender: TObject);
begin
  edit1.Text := DM.QueryKasir1['KDkasir'];
  edit2.Text := DM.QueryKasir1['NMkasir'];
  edit3.Text := DM.QueryKasir1['PWkasir'];
  ComboBox1.Text := DM.QueryKasir1['STTSkasir'];
  BitBtn1.Enabled := False;
  BitBtn3.Enabled := False;
  BitBtn5.Enabled := True;
  Edit2.Enabled := False;
end;

procedure TFkasir.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TFkasir.Edit4Exit(Sender: TObject);
begin
  Edit4.Text := 'Pencarian';
end;

procedure TFkasir.Edit4Enter(Sender: TObject);
begin
  Edit4.Text := '';
end;

end.
