object ImpressaoNFEDM: TImpressaoNFEDM
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
    Left = 56
    Top = 88
  end
  object dsSelectNota: TDataSource
    DataSet = SelectNotaQuery
    Left = 144
    Top = 88
  end
  object SelectNotaItenQuery: TFDQuery
    Connection = Conexão
    Left = 56
    Top = 144
  end
  object dsSelectNotaIten: TDataSource
    DataSet = SelectNotaItenQuery
    Left = 168
    Top = 144
  end
  object ConsultarFatura: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 56
    Top = 200
  end
  object dsConsultarFatura: TDataSource
    DataSet = ConsultarFatura
    Left = 176
    Top = 200
  end
  object TransmitirNotaQuery: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 56
    Top = 256
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 96
    Top = 24
  end
end
