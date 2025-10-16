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
  object QueryEstoque: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 160
    Top = 64
  end
  object dsEstoque: TDataSource
    DataSet = QueryEstoque
    Left = 64
    Top = 160
  end
  object tbEstoque: TFDTable
    IndexFieldNames = 'ID'
    MasterSource = dsEstoque
    Connection = Conexão
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'estoque.estoque'
    Left = 152
    Top = 160
    object tbEstoqueID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = False
    end
    object tbEstoqueCodigo: TStringField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      Required = True
      Size = 255
    end
    object tbEstoqueTamanho: TStringField
      FieldName = 'Tamanho'
      Origin = 'Tamanho'
      Required = True
      Size = 255
    end
    object tbEstoqueCor: TStringField
      FieldName = 'Cor'
      Origin = 'Cor'
      Required = True
      Size = 255
    end
    object tbEstoqueDeposito: TStringField
      FieldName = 'Deposito'
      Origin = 'Deposito'
      Required = True
      Size = 255
    end
    object tbEstoqueLote: TStringField
      FieldName = 'Lote'
      Origin = 'Lote'
      Required = True
      Size = 255
    end
    object tbEstoqueQtde: TStringField
      FieldName = 'Qtde'
      Origin = 'Qtde'
      Required = True
      Size = 255
    end
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 88
    Top = 24
  end
end
