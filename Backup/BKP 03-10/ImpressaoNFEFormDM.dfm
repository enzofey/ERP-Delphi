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
  object qryGridNota: TFDQuery
    Connection = Conexão
    Left = 56
    Top = 88
  end
  object dsSelectNota: TDataSource
    DataSet = qryGridNota
    Left = 144
    Top = 88
  end
  object qryGridNotaIten: TFDQuery
    Connection = Conexão
    Left = 56
    Top = 144
  end
  object dsSelectNotaIten: TDataSource
    DataSet = qryGridNotaIten
    Left = 168
    Top = 144
  end
  object ConsultarFatura: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 32
    Top = 408
  end
  object dsConsultarFatura: TDataSource
    DataSet = ConsultarFatura
    Left = 136
    Top = 408
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 96
    Top = 24
  end
  object qryNotaIten: TFDQuery
    Connection = Conexão
    Left = 416
    Top = 64
  end
  object qryNatureza: TFDQuery
    Connection = Conexão
    Left = 488
    Top = 64
  end
  object qryEmpresa: TFDQuery
    Connection = Conexão
    Left = 424
    Top = 128
  end
  object qryCEP: TFDQuery
    Connection = Conexão
    Left = 496
    Top = 128
  end
  object qryCidade: TFDQuery
    Connection = Conexão
    Left = 432
    Top = 192
  end
  object qryEntidade: TFDQuery
    Connection = Conexão
    Left = 496
    Top = 192
  end
  object qryPais: TFDQuery
    Connection = Conexão
    Left = 424
    Top = 264
  end
  object qryProduto: TFDQuery
    Connection = Conexão
    Left = 496
    Top = 256
  end
  object qryEstado: TFDQuery
    Connection = Conexão
    Left = 416
    Top = 328
  end
  object qryReceber: TFDQuery
    Connection = Conexão
    Left = 496
    Top = 328
  end
  object qryNota: TFDQuery
    Connection = Conexão
    Left = 416
    Top = 16
  end
  object qryNCM: TFDQuery
    Connection = Conexão
    Left = 488
    Top = 8
  end
end
