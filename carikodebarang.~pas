unit carikodebarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  TCkodebarang = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ckodebarang: TCkodebarang;

implementation

uses datakoneksi, servicekendaraan;

{$R *.dfm}

procedure TCkodebarang.Edit1Change(Sender: TObject);
begin
  if radiobutton1.Checked then
    begin
      with DM.QueryBarang1 do
        begin
          close;
          SQL.Clear;
          SQL.Add('select*from barang');
          SQL.Add('where NMbarang like'''+edit1.Text+'%''');
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
          SQL.Add('where KDbarang like'''+edit1.Text+'%''');
          ExecSQL;
          Open;
        end;
end;

procedure TCkodebarang.Edit1Enter(Sender: TObject);
begin
  Edit1.Text := '';
end;

procedure TCkodebarang.Edit1Exit(Sender: TObject);
begin
  Edit1.Text := 'Pencarian';
end;

procedure TCkodebarang.DBGrid1DblClick(Sender: TObject);
begin
  Fservicekendaraan.Edit6.Text := DM.QueryBarang1['KDbarang'];
  Fservicekendaraan.Edit15.Text := DM.QueryBarang1['NMbarang'];
  Fservicekendaraan.Edit16.Text := DM.QueryBarang1['Hrg_jual'];
  Fservicekendaraan.Edit6.Enabled := True;
  Fservicekendaraan.Edit17.Enabled := True;
  Fservicekendaraan.Edit17.SetFocus;
  Close;

end;

procedure TCkodebarang.FormShow(Sender: TObject);
begin
  DM.QueryBarang1.SQL.Clear;
  DM.QueryBarang1.SQL.Add('select*from Barang');
  DM.QueryBarang1.Open;
end;

end.
