unit login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TFlogin = class(TForm)
    Image1: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    CheckBox1: TCheckBox;
    BitBtn1: TBitBtn;
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flogin: TFlogin;

implementation

uses datakoneksi, DB, ADODB, menu, about;

{$R *.dfm}

procedure TFlogin.CheckBox1Click(Sender: TObject);
begin
  If CheckBox1.Checked then
    begin
      Edit2.PasswordChar := #0;
    end
    else
      begin
        Edit2.PasswordChar := '*';
      end;
end;

procedure TFlogin.SpeedButton1Click(Sender: TObject);
begin
  if (edit1.Text ='') and (edit2.Text ='') then
    begin
      Application.MessageBox('Username atau Password masih kosong','INFORMASI',MB_ICONINFORMATION);
    end
  else
  if edit1.Text ='' then
    begin
      Application.MessageBox('Username masih kosong','INFORMASI',MB_ICONINFORMATION);
    end
  else
  if edit2.Text ='' then
    begin
      Application.MessageBox('Password masih kosong','INFORMASI',MB_ICONINFORMATION);
    end
  else
    begin
      DM.QueryLogin1.Close;
      DM.QueryLogin1.SQL.Clear;
      DM.QueryLogin1.SQL.Text := 'select*from Kasir';
      DM.QueryLogin1.Open;
      if DM.QueryLogin1.Locate('NMkasir',edit1.Text,[]) then
        begin
          if DM.QueryLogin1.FieldByName('PWkasir').AsString = edit2.Text then
            begin
              if DM.QueryLogin1.FieldValues['STTSkasir']='Admin' then
                begin
                  Application.MessageBox('Selamat Datang Admin','INFORMASI',MB_ICONINFORMATION);
                  Fmenu.StatusBar1.Panels[0].Text := DM.QueryLogin1.FieldByName('STTSkasir').AsString;
                  Fmenu.StatusBar1.Panels[1].Text := DM.QueryLogin1.FieldByName('KDkasir').AsString;
                  Fmenu.StatusBar1.Panels[2].Text := DM.QueryLogin1.FieldByName('NMkasir').AsString;
                  Fmenu.Login2.Visible := false;
                  Fmenu.Keluar1.Visible := True;
                  Fmenu.File1.Enabled := True;
                  Fmenu.Master1.Enabled := True;
                  Fmenu.Kasir1.Enabled := True;
                  Fmenu.about1.Enabled := True;
                  Fmenu.Transaksi1.Enabled := True;
                  Fmenu.Laporan1.Enabled := True;
                  Fmenu.Tutup1.Enabled := False;
                  close;
                  edit1.Text :='';
                  edit2.Text :='';
                  edit1.SetFocus;
                end
              else
              if DM.QueryLogin1.FieldValues['STTSkasir']='Kasir' then
                begin
                  Application.MessageBox('Selamat Datang Kasir','INFORMASI',MB_ICONINFORMATION);
                  Fmenu.StatusBar1.Panels[0].Text := DM.QueryLogin1.FieldByName('STTSkasir').AsString;
                  Fmenu.StatusBar1.Panels[1].Text := DM.QueryLogin1.FieldByName('KDkasir').AsString;
                  Fmenu.StatusBar1.Panels[2].Text := DM.QueryLogin1.FieldByName('NMkasir').AsString;
                  Fmenu.Keluar1.Visible := True;
                  Fmenu.Login2.Visible := False;
                  Fmenu.File1.Enabled := True;
                  Fmenu.about1.Enabled := True;
                  Fmenu.Master1.Enabled := True;
                  Fmenu.Kasir1.Enabled := False;
                  Fmenu.Transaksi1.Enabled := True;
                  Fmenu.Laporan1.Enabled := True;
                  Fmenu.Tutup1.Enabled := False;
                  close;
                  edit1.Text :='';
                  edit2.Text :='';
                  edit1.SetFocus;
                end
            end
          else
            Application.MessageBox('Password masih salah','PERINGATAN',MB_ICONWARNING);
          end
          else
            Application.MessageBox('Username masih salah','PERINGATAN',MB_ICONWARNING);
          end
end;

procedure TFlogin.SpeedButton2Click(Sender: TObject);
begin
  Edit1.Text :='';
  Edit2.Text :='';
  Close;
end;

procedure TFlogin.BitBtn1Click(Sender: TObject);
begin
  if (edit1.Text ='') and (edit2.Text ='') then
    begin
      Application.MessageBox('Username atau Password masih kosong','INFORMASI',MB_ICONINFORMATION);
    end
  else
  if edit1.Text ='' then
    begin
      Application.MessageBox('Username masih kosong','INFORMASI',MB_ICONINFORMATION);
    end
  else
  if edit2.Text ='' then
    begin
      Application.MessageBox('Password masih kosong','INFORMASI',MB_ICONINFORMATION);
    end
  else
    begin
      DM.QueryLogin1.Close;
      DM.QueryLogin1.SQL.Clear;
      DM.QueryLogin1.SQL.Text := 'select*from Kasir';
      DM.QueryLogin1.Open;
      if DM.QueryLogin1.Locate('NMkasir',edit1.Text,[]) then
        begin
          if DM.QueryLogin1.FieldByName('PWkasir').AsString = edit2.Text then
            begin
              if DM.QueryLogin1.FieldValues['STTSkasir']='Admin' then
                begin
                  Application.MessageBox('Selamat Datang Admin','INFORMASI',MB_ICONINFORMATION);
                  Fmenu.StatusBar1.Panels[0].Text := DM.QueryLogin1.FieldByName('STTSkasir').AsString;
                  Fmenu.StatusBar1.Panels[1].Text := DM.QueryLogin1.FieldByName('KDkasir').AsString;
                  Fmenu.StatusBar1.Panels[2].Text := DM.QueryLogin1.FieldByName('NMkasir').AsString;
                  Fmenu.Login2.Visible := false;
                  Fmenu.Keluar1.Visible := True;
                  Fmenu.File1.Enabled := True;
                  Fmenu.Master1.Enabled := True;
                  Fmenu.SparePart1.Enabled := True;
                  Fmenu.Jasa1.Enabled := True;
                  Fmenu.Kasir1.Enabled := True;
                  Fmenu.Mekanik1.Enabled := True;
                  Fmenu.about1.Enabled := True;
                  Fmenu.Transaksi1.Enabled := True;
                  Fmenu.Laporan1.Enabled := True;
                  Fmenu.Tutup1.Enabled := False;
                  close;
                  edit1.Text :='';
                  edit2.Text :='';
                  edit1.SetFocus;
                end
              else
              if DM.QueryLogin1.FieldValues['STTSkasir']='Kasir' then
                begin
                  Application.MessageBox('Selamat Datang Kasir','INFORMASI',MB_ICONINFORMATION);
                  Fmenu.StatusBar1.Panels[0].Text := DM.QueryLogin1.FieldByName('STTSkasir').AsString;
                  Fmenu.StatusBar1.Panels[1].Text := DM.QueryLogin1.FieldByName('KDkasir').AsString;
                  Fmenu.StatusBar1.Panels[2].Text := DM.QueryLogin1.FieldByName('NMkasir').AsString;
                  Fmenu.Keluar1.Visible := True;
                  Fmenu.Login2.Visible := False;
                  Fmenu.File1.Enabled := True;
                  Fmenu.about1.Enabled := True;
                  Fmenu.Master1.Enabled := True;
                  Fmenu.SparePart1.Enabled := False;
                  Fmenu.Jasa1.Enabled := False;
                  Fmenu.Kasir1.Enabled := False;
                  Fmenu.Mekanik1.Enabled := False;
                  Fmenu.Transaksi1.Enabled := True;
                  Fmenu.Laporan1.Enabled := True;
                  Fmenu.Tutup1.Enabled := False;
                  close;
                  edit1.Text :='';
                  edit2.Text :='';
                  edit1.SetFocus;
                end
            end
          else
            Application.MessageBox('Password masih salah','PERINGATAN',MB_ICONWARNING);
          end
          else
            Application.MessageBox('Username masih salah','PERINGATAN',MB_ICONWARNING);
          end
end;

procedure TFlogin.Edit2Change(Sender: TObject);
begin
  Edit2.PasswordChar := '*';
end;

procedure TFlogin.Edit2Enter(Sender: TObject);
begin
  Edit2.Text := '';
end;

procedure TFlogin.Edit2Exit(Sender: TObject);
begin
  Edit2.Text := 'Kata Sandi';
end;

procedure TFlogin.Edit1Exit(Sender: TObject);
begin
  Edit1.Text := 'Nama Pengguna';
end;

procedure TFlogin.Edit1Enter(Sender: TObject);
begin
  Edit1.Text := '';
end;

end.
