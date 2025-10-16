object FatGeralDM: TFatGeralDM
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
  object InsertNOTA: TFDQuery
    Connection = Conexão
    Left = 240
    Top = 64
  end
  object qrySelect: TFDQuery
    Connection = Conexão
    Left = 32
    Top = 88
  end
  object InsertNOTAITEN: TFDQuery
    Connection = Conexão
    Left = 328
    Top = 64
  end
  object UpdateEstoque: TFDQuery
    Connection = Conexão
    Left = 240
    Top = 136
  end
  object InsertProdMov: TFDQuery
    Connection = Conexão
    Left = 240
    Top = 200
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 88
    Top = 24
  end
  object SelectID_NOTA: TFDQuery
    Connection = Conexão
    Left = 160
    Top = 256
  end
  object SelectFatura: TFDQuery
    Connection = Conexão
    Left = 240
    Top = 256
  end
  object InsertNOTA_FATURA: TFDQuery
    Connection = Conexão
    Left = 437
    Top = 64
  end
  object InsertRECEBER: TFDQuery
    Connection = Conexão
    Left = 541
    Top = 64
  end
  object qryModoIPI: TFDQuery
    Connection = Conexão
    Left = 32
    Top = 392
  end
  object qryModoICMS: TFDQuery
    Connection = Conexão
    Left = 112
    Top = 392
  end
  object qryModoPIS: TFDQuery
    Connection = Conexão
    Left = 192
    Top = 392
  end
  object qryModoCOFINS: TFDQuery
    Connection = Conexão
    Left = 280
    Top = 392
  end
  object qryModoCSOSN: TFDQuery
    Connection = Conexão
    Left = 376
    Top = 392
  end
end
