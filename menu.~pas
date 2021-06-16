unit menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ComCtrls;

type
  TFmenu = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Master1: TMenuItem;
    SparePart1: TMenuItem;
    Jasa1: TMenuItem;
    Kasir1: TMenuItem;
    Mekanik1: TMenuItem;
    Pelanggan1: TMenuItem;
    Transaksi1: TMenuItem;
    PendaftaranService1: TMenuItem;
    ServiceKendaraan1: TMenuItem;
    PenjualanSparePart1: TMenuItem;
    Laporan1: TMenuItem;
    LaporanBarang1: TMenuItem;
    LaporanService1: TMenuItem;
    LaporanSparePart1: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Image1: TImage;
    Login2: TMenuItem;
    Keluar1: TMenuItem;
    About1: TMenuItem;
    Tutup1: TMenuItem;
    procedure SparePart1Click(Sender: TObject);
    procedure Jasa1Click(Sender: TObject);
    procedure Kasir1Click(Sender: TObject);
    procedure Mekanik1Click(Sender: TObject);
    procedure Pelanggan1Click(Sender: TObject);
    procedure ServiceKendaraan1Click(Sender: TObject);
    procedure PenjualanSparePart1Click(Sender: TObject);
    procedure LaporanBarang1Click(Sender: TObject);
    procedure LaporanService1Click(Sender: TObject);
    procedure LaporanSparePart1Click(Sender: TObject);
    procedure PendaftaranService1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Login2Click(Sender: TObject);
    procedure Keluar1Click(Sender: TObject);
    procedure Tutup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fmenu: TFmenu;

implementation

uses barang, jasaservice, kasir, mekanik, pelanggan, daftarservice, penjualansparepart, servicekendaraan, laporanbarang, laporanjualsparepart, laporantransaksiservice,
  login, about, datakoneksi, RreportBarang;

{$R *.dfm}

procedure TFmenu.SparePart1Click(Sender: TObject);
begin
fbarang.ShowModal;
end;

procedure TFmenu.Jasa1Click(Sender: TObject);
begin
Fjasaservice.ShowModal;
end;

procedure TFmenu.Kasir1Click(Sender: TObject);
begin
Fkasir.ShowModal;
end;

procedure TFmenu.Mekanik1Click(Sender: TObject);
begin
Fmekanik.ShowModal;
end;

procedure TFmenu.Pelanggan1Click(Sender: TObject);
begin
Fpelanggan.ShowModal;
end;

procedure TFmenu.ServiceKendaraan1Click(Sender: TObject);
begin
Fservicekendaraan.ShowModal;
end;

procedure TFmenu.PenjualanSparePart1Click(Sender: TObject);
begin
Fpenjualansparepart.ShowModal;
end;

procedure TFmenu.LaporanBarang1Click(Sender: TObject);
begin
Flaporanbarang.ShowModal;
end;

procedure TFmenu.LaporanService1Click(Sender: TObject);
begin
Flaporanservice.ShowModal;
end;

procedure TFmenu.LaporanSparePart1Click(Sender: TObject);
begin
Flaporanjualsparepart.ShowModal;
end;

procedure TFmenu.PendaftaranService1Click(Sender: TObject);
begin
Fpendaftarservice.ShowModal;
end;

procedure TFmenu.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[3].Text := DateToStr(Date);
  StatusBar1.Panels[4].Text := TimeToStr(Time);
end;

procedure TFmenu.FormActivate(Sender: TObject);
begin
  Fmenu.Keluar1.Visible := False;
  Fmenu.Login2.Visible := True;
  Fmenu.Master1.Enabled := False;
  Fmenu.Transaksi1.Enabled := False;
  Fmenu.Laporan1.Enabled := False;
end;

procedure TFmenu.Login2Click(Sender: TObject);
begin
  Flogin.ShowModal;
end;

procedure TFmenu.Keluar1Click(Sender: TObject);
begin
  Fmenu.StatusBar1.Panels[0].Text := '';
  Fmenu.StatusBar1.Panels[1].Text := '';
  Fmenu.StatusBar1.Panels[2].Text := '';
  Fmenu.Keluar1.Visible := False;
  Fmenu.Login2.Visible := True;
  Fmenu.Master1.Enabled := False;
  Fmenu.Transaksi1.Enabled := False;
  Fmenu.Laporan1.Enabled := False;
  Fmenu.Tutup1.Enabled := True;
  Flogin.ShowModal;

end;

procedure TFmenu.Tutup1Click(Sender: TObject);
begin
  if Application.MessageBox('Yakin ingin menutup ?','KONFIRMASI',MB_YESNO or MB_ICONINFORMATION)= mryes then
  Application.Terminate;
end;

procedure TFmenu.About1Click(Sender: TObject);
begin
  Fabout.ShowModal;
end;

end.
