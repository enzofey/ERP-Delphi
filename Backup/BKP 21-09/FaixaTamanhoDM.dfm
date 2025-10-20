object CadFaixaTamanhoDM: TCadFaixaTamanhoDM
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
  object qryConsultarFaixa: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 40
    Top = 160
  end
  object dsConsultarFaixa: TDataSource
    DataSet = qryConsultarFaixa
    Left = 144
    Top = 160
  end
  object qryInsert: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 104
    Top = 96
  end
  object qryConsultarTamanho: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 48
    Top = 224
  end
  object dsConsultarTamanho: TDataSource
    DataSet = qryConsultarTamanho
    Left = 176
    Top = 224
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 96
    Top = 24
  end
  object qrySelect: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 32
    Top = 96
  end
  object qryUpdate: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 176
    Top = 96
  end
  object qryDelete: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 256
    Top = 96
  end
  object qryAcesso: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 40
    Top = 288
  end
  object dsAcesso: TDataSource
    DataSet = qryAcesso
    Left = 104
    Top = 288
  end
end
