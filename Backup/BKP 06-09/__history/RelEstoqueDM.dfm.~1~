object EstoqueDataModule: TEstoqueDataModule
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
  object ConsultarEstoque: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 40
    Top = 80
  end
  object dsEstoque: TDataSource
    DataSet = ConsultarEstoque
    Left = 128
    Top = 80
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 88
    Top = 24
  end
end
