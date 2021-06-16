unit datakoneksi;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient, DBTables, MidasLib;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    QueryBarang1: TADOQuery;
    DataBarang1: TDataSource;
    QueryBarang2: TADOQuery;
    QueryKasir1: TADOQuery;
    QueryKasir2: TADOQuery;
    QueryMekanik1: TADOQuery;
    QueryMekanik2: TADOQuery;
    QueryPelanggan1: TADOQuery;
    QueryPelanggan2: TADOQuery;
    QueryJasa1: TADOQuery;
    QueryJasa2: TADOQuery;
    DataKasir1: TDataSource;
    DataMekanik1: TDataSource;
    DataPelanggan1: TDataSource;
    DataJasa1: TDataSource;
    QueryDaftarService1: TADOQuery;
    QueryDaftarService2: TADOQuery;
    DataDaftarService1: TDataSource;
    DataService1: TDataSource;
    CDSservice2: TClientDataSet;
    CDSservice1: TClientDataSet;
    CDSservice1KDbarang: TStringField;
    CDSservice1NMbarang: TStringField;
    CDSservice1Harga: TFloatField;
    CDSservice1Jumlah: TFloatField;
    CDSservice1Subtotal: TFloatField;
    DataSparepart1: TDataSource;
    CDSsparepart1: TClientDataSet;
    CDSsparepart2: TClientDataSet;
    QuerySparepart1: TADOQuery;
    QuerySparepart2: TADOQuery;
    QueryService1: TADOQuery;
    QueryService2: TADOQuery;
    CDSsparepart1KDbarang: TStringField;
    CDSsparepart1NMbarang: TStringField;
    CDSsparepart1Harga: TFloatField;
    CDSsparepart1Jumlah: TFloatField;
    CDSsparepart1SubTotal: TFloatField;
    QueryLogin1: TADOQuery;
    QueryRservice1: TADOQuery;
    QueryRservice2: TADOQuery;
    QueryRsparepart1: TADOQuery;
    QueryRsparepart2: TADOQuery;
    RSparepart1: TADOQuery;
    RService1: TADOQuery;
    RReportbarang1: TADOQuery;
    QueryKasir1KDkasir: TWideStringField;
    QueryKasir1NMkasir: TWideStringField;
    QueryKasir1PWkasir: TWideStringField;
    QueryKasir1STTSkasir: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
