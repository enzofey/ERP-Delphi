object ImpressaoNFEFormDataModule: TImpressaoNFEFormDataModule
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
  object SelectNotaQuery: TFDQuery
    Connection = Conexão
    Left = 136
    Top = 56
  end
  object dsSelectNota: TDataSource
    DataSet = SelectNotaQuery
    Left = 224
    Top = 56
  end
  object SelectNotaItenQuery: TFDQuery
    Connection = Conexão
    Left = 136
    Top = 112
  end
  object dsSelectNotaIten: TDataSource
    DataSet = SelectNotaItenQuery
    Left = 248
    Top = 112
  end
  object ConsultarFatura: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 136
    Top = 168
  end
  object dsConsultarFatura: TDataSource
    DataSet = ConsultarFatura
    Left = 256
    Top = 168
  end
  object TransmitirNotaQuery: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 136
    Top = 224
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 32
    Top = 96
  end
end
