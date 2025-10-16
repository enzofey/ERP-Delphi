object LogModule: TLogModule
  Height = 480
  Width = 640
  object Conexão: TFDConnection
    Params.Strings = (
      'Database=00001P'
      'User_Name=postgres'
      'Password=evf'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object FDQuery1: TFDQuery
    Connection = Conexão
    Left = 112
    Top = 112
  end
  object dsLogs: TDataSource
    DataSet = FDQuery1
    Left = 40
    Top = 112
  end
  object dsInserirLog: TDataSource
    DataSet = InserirLog
    Left = 40
    Top = 192
  end
  object InserirLog: TFDQuery
    Connection = Conexão
    Left = 112
    Top = 192
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 88
    Top = 24
  end
end
