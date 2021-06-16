unit jasaservice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TFjasaservice = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label4: TLabel;
    Edit4: TEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit4Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fjasaservice: TFjasaservice;

implementation

uses datakoneksi;

{$R *.dfm}

procedure TFjasaservice.BitBtn1Click(Sender: TObject);
begin
  //jika ada yang kosong maka tampil pesan
  if Edit1.Text ='' then
  begin
    ShowMessage('Kode Jasa masih kosong, harap diisi');
    Edit2.SetFocus;
    exit;
  end;
  if Edit2.Text ='' then
  begin
    ShowMessage('Nama Jasa masih kosong, harap diisi');
    Edit2.SetFocus;
    exit;
  end;
  if Edit3.Text ='' then
  begin
    ShowMessage('Harga masih kosong, harap diisi');
    Edit3.SetFocus;
    exit;
  end;

  //Proses untuk menyimpan
  DM.ADOCon.Execute('insert into Jasa(KDjasa, NMjasa, '+
  'Harga) values ('+QuotedStr(Edit1.Text)+
  ','+QuotedStr(Edit2.text)+','+QuotedStr(Edit3.text)+')');

  //Refres data agar langsung tampil dalam program
  DM.QueryJasa1.Close;
  DM.QueryJasa1.Open;

  //KOsongkan Form
  Edit1.Text :='';
  Edit2.Text :='';
  Edit3.Text :='';

  //Pesan Penyimpanan
  ShowMessage('Data berhasil disimpan');

  //arahkan kursor ke kode barang
  Edit2.SetFocus;
end;

procedure TFjasaservice.BitBtn3Click(Sender: TObject);
begin
  //Jika tidak ada datanya, maka tidak ada yg dihapus
  if DM.Queryjasa1.RecordCount<1 then exit; // agar tidak eror

  //Tambah pesan Hapus ???
  // Ok..
  if Application.MessageBox('Akan menghapus data  ???',' Pesan Konfirmasi',MB_YESNO)=mrNo then exit;

  DM.ADOCon.Execute('delete from Jasa where KDjasa='+
  QuotedStr(DM.Queryjasa1['KDjasa'])); //ketika id nilainya 001 simulasinya
  // delete from Jasa where KDjasa = '001'

  //Refresh data
  DM.Queryjasa1.Close;
  DM.Queryjasa1.Open;
end;

procedure TFjasaservice.BitBtn4Click(Sender: TObject);
begin
  //KOsongkan Form
  Edit1.Text :='';
  Edit2.Text :='';
  Edit3.Text :='';
  BitBtn1.Enabled := True;
  BitBtn3.Enabled := True;
  BitBtn2.Enabled := False;
  Edit2.Enabled := True;

end;

procedure TFjasaservice.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  edit1.Text := 'KJ00' + IntToStr(DM.QueryJasa1.RecordCount+1);
    if dm.QueryJasa1.Locate('KDjasa',edit1.Text, []) = true then
      begin
        edit1.Text := 'KJ0' + IntToStr(DM.QueryJasa1.RecordCount+2);
      end
    else
      begin
        edit1.Text := 'KJ00' + IntToStr(DM.QueryJasa1.RecordCount+1);
      end;
end;

procedure TFjasaservice.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#13,#8]) then
    key := #0;
end;

procedure TFjasaservice.BitBtn5Click(Sender: TObject);
begin
  edit1.Text := '';
  edit2.Text := '';
  edit3.Text := '';
  edit4.Text := 'Pencarian';
  BitBtn1.Enabled := True;
  BitBtn3.Enabled := True;
  BitBtn2.Enabled := False;
  Edit2.Enabled := True;
end;

procedure TFjasaservice.FormActivate(Sender: TObject);
begin
  edit2.SetFocus;
  BitBtn2.Enabled := False;
end;

procedure TFjasaservice.Edit4Change(Sender: TObject);
begin
  if radiobutton1.Checked then
    begin
      with DM.QueryJasa1 do
        begin
          close;
          SQL.Clear;
          SQL.Add('select*from Jasa');
          SQL.Add('where NMjasa like'''+edit4.Text+'%''');
          ExecSQL;
          Open;
        end;
    end
    else if RadioButton2.Checked then
      with DM.QueryJasa1 do
        begin
          close;
          SQL.Clear;
          SQL.Add('select*from Jasa');
          SQL.Add('where KDjasa like'''+edit4.Text+'%''');
          ExecSQL;
          Open;
        end;
end;

procedure TFjasaservice.DBGrid1DblClick(Sender: TObject);
begin
  edit1.Text := DM.QueryJasa1['KDjasa'];
  edit2.Text := DM.QueryJasa1['NMjasa'];
  edit3.Text := DM.QueryJasa1['Harga'];
  BitBtn1.Enabled := False;
  BitBtn3.Enabled := False;
  BitBtn2.Enabled := True;
  Edit2.Enabled := False;
end;

procedure TFjasaservice.BitBtn2Click(Sender: TObject);
begin
  BitBtn1.Enabled := True;
  BitBtn3.Enabled := True;
  DM.QueryJasa1.Edit;
  DM.QueryJasa1['KDjasa'] := edit1.Text;
  DM.QueryJasa1['NMjasa'] := edit2.Text;
  DM.QueryJasa1['Harga'] := edit3.Text;
  DM.QueryJasa1.post;
  edit1.text :='';
  edit2.text :='';
  edit3.text :='';
  BitBtn2.Enabled := False;
  Edit2.Enabled := True;
end;

procedure TFjasaservice.Edit4Exit(Sender: TObject);
begin
  Edit4.Text := 'Pencarian';
end;

procedure TFjasaservice.Edit4Enter(Sender: TObject);
begin
  Edit4.Text := '';
end;

end.
