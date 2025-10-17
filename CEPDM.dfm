object CadCepDM: TCadCepDM
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
  object qryConsultarCEP: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      'select * from cadcep')
    Left = 32
    Top = 136
  end
  object ConsultarCEP: TDataSource
    DataSet = qryConsultarCEP
    Left = 120
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
    Left = 184
    Top = 80
  end
  object qryDelete: TFDQuery
    Connection = Conexão
    Left = 264
    Top = 80
  end
  object qryAcesso: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 32
    Top = 192
  end
  object dsAcesso: TDataSource
    DataSet = qryAcesso
    Left = 112
    Top = 192
  end
end
