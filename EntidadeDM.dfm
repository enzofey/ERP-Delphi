object CadEntidadeDM: TCadEntidadeDM
  Height = 480
  Width = 640
  object Conexão: TFDConnection
    Params.Strings = (
	  'server=192.168.1.23'
      'Database=00001P'
      'User_Name=postgres'
      'Password=evf'
      'DriverID=PG')
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object ConsultarEntidade: TDataSource
    DataSet = qryConsultarEntidade
    Left = 152
    Top = 144
  end
  object qrySelect: TFDQuery
    Connection = Conexão
    Left = 32
    Top = 80
  end
  object qryConsultarEntidade: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 48
    Top = 144
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
  object dsAcesso: TDataSource
    DataSet = qryAcesso
    Left = 120
    Top = 200
  end
end
