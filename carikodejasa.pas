unit carikodejasa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  TCkodejasa = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ckodejasa: TCkodejasa;

implementation

uses datakoneksi, servicekendaraan;

{$R *.dfm}

procedure TCkodejasa.Edit1Change(Sender: TObject);
begin
  if radiobutton1.Checked then
    begin
      with DM.QueryJasa1 do
        begin
          close;
          SQL.Clear;
          SQL.Add('select*from Jasa');
          SQL.Add('where NMjasa like'''+edit1.Text+'%''');
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
          SQL.Add('where KDjasa like'''+edit1.Text+'%''');
          ExecSQL;
          Open;
        end;
end;

procedure TCkodejasa.Edit1Exit(Sender: TObject);
begin
  Edit1.Text := 'Pencarian';
end;

procedure TCkodejasa.Edit1Enter(Sender: TObject);
begin
  Edit1.Text := '';
end;

procedure TCkodejasa.DBGrid1DblClick(Sender: TObject);
begin
  Fservicekendaraan.Edit14.Text := DM.QueryJasa1['KDjasa'];
  Fservicekendaraan.Edit7.Text := DM.QueryJasa1['NMjasa'];
  Fservicekendaraan.Edit8.Text := DM.QueryJasa1['Harga'];
  Fservicekendaraan.Edit6.Enabled := True;
  Fservicekendaraan.Edit17.Enabled := True;
  Fservicekendaraan.Edit12.Enabled := True;
  Fservicekendaraan.Edit6.SetFocus;
  Close;
end;

end.
