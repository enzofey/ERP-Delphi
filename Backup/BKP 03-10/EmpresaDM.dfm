object CadEmpresaDM: TCadEmpresaDM
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
  object InsertQuery: TFDQuery
    Connection = Conexão
    Left = 104
    Top = 88
  end
  object CBEmpresa: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      
        'select CONCAT(EMP_ID, '#39' '#39', '#39'-'#39', '#39' '#39', NOME) as EMPRESA from empre' +
        'sa')
    Left = 24
    Top = 176
  end
  object SelectQuery: TFDQuery
    Connection = Conexão
    Left = 32
    Top = 88
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 88
    Top = 24
  end
  object UpdateQuery: TFDQuery
    Connection = Conexão
    Left = 184
    Top = 88
  end
  object DeleteQuery: TFDQuery
    Connection = Conexão
    Left = 264
    Top = 88
  end
end
