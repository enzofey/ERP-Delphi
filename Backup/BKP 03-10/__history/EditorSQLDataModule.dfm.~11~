object EditorSQLModule: TEditorSQLModule
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
  object SelectQuery: TFDQuery
    Connection = Conexão
    Left = 120
    Top = 120
  end
  object dsEditorSQL: TDataSource
    DataSet = SelectQuery
    Left = 40
    Top = 120
  end
  object TablesBanco: TFDQuery
    Active = True
    Connection = Conexão
    SQL.Strings = (
      'SELECT table_name AS TABELA'
      'FROM information_schema.tables'
      'WHERE table_schema = '#39'estoque'#39
      '  AND table_type = '#39'BASE TABLE'#39
      'ORDER BY table_name;'
      '')
    Left = 128
    Top = 208
  end
  object dsTablesBanco: TDataSource
    DataSet = TablesBanco
    Left = 40
    Top = 208
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 88
    Top = 24
  end
end
