unit laporanbarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, StdCtrls, Buttons;

type
  TFlaporanbarang = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flaporanbarang: TFlaporanbarang;

implementation

uses datakoneksi,menu,RreportBarang;

{$R *.dfm}

procedure TFlaporanbarang.BitBtn1Click(Sender: TObject);
begin
DM.QueryRsparepart1.SQL.Clear;
DM.QueryRsparepart1.SQL.Add('select*from Barang');
DM.QueryRsparepart1.Open;

ReportBarang.Preview;
end;

end.
