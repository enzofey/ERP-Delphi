object EntradaNFeDM: TEntradaNFeDM
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
  object ConsultarNotaEntrada: TDataSource
    DataSet = qryConsultarNotaEntrada
    Left = 176
    Top = 136
  end
  object qryConsultarNotaEntrada: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 40
    Top = 136
  end
  object qrySelect: TFDQuery
    Connection = Conexão
    Left = 32
    Top = 80
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 88
    Top = 24
  end
  object qryInsert: TFDQuery
    Connection = Conexão
    Left = 104
    Top = 80
  end
  object qryUpdate: TFDQuery
    Connection = Conexão
    Left = 176
    Top = 80
  end
  object qryDelete: TFDQuery
    Connection = Conexão
    Left = 256
    Top = 80
  end
  object qryAcesso: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 40
    Top = 200
  end
  object dsAcessoGrid: TDataSource
    DataSet = qryAcesso
    Left = 120
    Top = 200
  end
end
