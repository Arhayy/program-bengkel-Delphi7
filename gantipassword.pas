unit gantipassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses datakoneksi;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  DM.QueryGantiPass.Close;
  DM.QueryGantiPass.SQL.Add('select*from Kasir where PWkasir ='+QuotedStr(Edit2.Text)+' and KDkasir ='+QuotedStr(Edit1.Text)+'');
  DM.QueryGantiPass.Open;
    if Edit2.Text ='' then
      begin
        MessageDlg('Silahkan masukan password lama',mtWarning,[mbOK],0);
        Edit2.Setfocus;
        Exit;
      end;
    if (DM.QueryGantiPass.FieldByName('PWkasir').AsString = Edit2.Text) AND (DM.QueryGantiPass.FieldByName('KDkasir').AsString = Edit1.Text) then
      begin
      if (Edit3.Text ='') or (Edit4.Text ='') then
        begin
          MessageDlg('Semua data harus diisi',mtWarning,[mbOK],0);
          Edit2.SetFocus;
        end;
          if (Edit2.Text <>'') and (Edit4.Text <>'') then
            begin
              if Edit2.Text = Edit4.Text then
                begin
                  DM.ADOCom.CommandText :='UPDATE Kasir set PWkasir ='+QuotedStr(Edit4.Text)+'where KDkasir'+QuotedStr(Edit1.Text)+'';
                  DM.ADOCom.Execute;;
                    MessageDlg('Password berhasil diganti',mtinformation,[mbok],0);
                  Close;
                end
                else
                  begin
                    MessageDlg('Password tidak sesuai dengan Konfirmasi Password',mtWarning,[mbok],0);
                    edit3.text :='';
                    edit4.text :='';
                    edit4.setfocus;
                  end;
            end;
      end;
end;
end.




