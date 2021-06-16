unit caridatabarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TCdatabarang = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cdatabarang: TCdatabarang;

implementation

uses datakoneksi,penjualansparepart;

{$R *.dfm}

procedure TCdatabarang.Edit1Change(Sender: TObject);
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

procedure TCdatabarang.Edit1Exit(Sender: TObject);
begin
  Edit1.Text := 'Pencarian';
end;

procedure TCdatabarang.Edit1Enter(Sender: TObject);
begin
  Edit1.Text := '';
end;

procedure TCdatabarang.DBGrid1DblClick(Sender: TObject);
begin
  Fpenjualansparepart.Edit6.Text := DM.QueryBarang1['KDbarang'];
  Fpenjualansparepart.Edit11.Text := DM.QueryBarang1['NMbarang'];
  Fpenjualansparepart.Edit12.Text := DM.QueryBarang1['Hrg_jual'];
  Fpenjualansparepart.Edit6.Enabled := True;
  Fpenjualansparepart.Edit13.Enabled := True;
  Fpenjualansparepart.Edit13.SetFocus;
  Close;
end;

procedure TCdatabarang.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Edit1.Text :='';
end;

procedure TCdatabarang.FormShow(Sender: TObject);
begin
  DM.QueryBarang1.SQL.Clear;
  DM.QueryBarang1.SQL.Add('select*from Barang');
  DM.QueryBarang1.Open;
end;

end.
