//
//  MarketDataModel.swift
//  CryptoApp
//
//  Created by Tamim Khan on 7/7/23.
//

import Foundation



// JSON DATA
/*

URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 
 
 {
   "data": {
     "active_cryptocurrencies": 9880,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 774,
     "total_market_cap": {
       "btc": 40327282.37963252,
       "eth": 652349062.6073096,
       "ltc": 12575841180.709475,
       "bch": 4314676335.152988,
       "bnb": 5201322305.266485,
       "eos": 1687371085644.2979,
       "xrp": 2608980447580.8115,
       "xlm": 12705131244140.227,
       "link": 198170651719.15323,
       "dot": 236774791101.0318,
       "yfi": 176893290.68620753,
       "usd": 1217255190381.719,
       "aed": 4471027004479.657,
       "ars": 316942820195640.25,
       "aud": 1832864961344.6113,
       "bdt": 132260406240229.28,
       "bhd": 458900337753.1468,
       "bmd": 1217255190381.719,
       "brl": 5989868123575.162,
       "cad": 1627307077344.8503,
       "chf": 1090060543773.1617,
       "clp": 977730781402040.6,
       "cny": 8806354400335.58,
       "czk": 26745101351984.97,
       "dkk": 8334201805324.7705,
       "eur": 1118320340273.0637,
       "gbp": 954858792522.2754,
       "hkd": 9529996786700.031,
       "huf": 433518621859893.2,
       "idr": 18433930014862196,
       "ils": 4525024444724.988,
       "inr": 100710833952208.16,
       "jpy": 174185971725725.78,
       "krw": 1589479630703444,
       "kwd": 374052781962.77966,
       "lkr": 378646718875597.44,
       "mmk": 2556747187150992.5,
       "mxn": 21109718633187.176,
       "myr": 5683973111487.452,
       "ngn": 935460613808349.9,
       "nok": 13087742784195.305,
       "nzd": 1970552347694.2566,
       "php": 67693998082018.625,
       "pkr": 336625836624112.8,
       "pln": 5012693391647.627,
       "rub": 111982998016017.55,
       "sar": 4566607099283.622,
       "sek": 13291922735319.562,
       "sgd": 1645270112189.3132,
       "thb": 42853468977388.29,
       "try": 31775174713240.836,
       "twd": 38112785865093.88,
       "uah": 44965815730444.9,
       "vef": 121883762212.92166,
       "vnd": 28793739648772536,
       "zar": 23298685514202.01,
       "xdr": 915330864725.0109,
       "xag": 53617668798.48589,
       "xau": 635309828.964027,
       "bits": 40327282379632.516,
       "sats": 4032728237963252
     },
     "total_volume": {
       "btc": 1843264.2725565694,
       "eth": 29817325.874334797,
       "ltc": 574811824.1028527,
       "bch": 197213604.9576592,
       "bnb": 237740085.85789195,
       "eos": 77125723658.58163,
       "xrp": 119250298136.95518,
       "xlm": 580721365749.4983,
       "link": 9057909698.5631,
       "dot": 10822413198.341438,
       "yfi": 8085372.074105564,
       "usd": 55637842934.53582,
       "aed": 204360022612.26688,
       "ars": 14486703354079.77,
       "aud": 83775903068.87637,
       "bdt": 6045308959860.889,
       "bhd": 20975244234.948277,
       "bmd": 55637842934.53582,
       "brl": 273782641874.4204,
       "cad": 74380340532.5213,
       "chf": 49824077812.77735,
       "clp": 44689751235193.98,
       "cny": 402517538494.1926,
       "czk": 1222455044799.067,
       "dkk": 380936565063.2171,
       "eur": 51115765974.345535,
       "gbp": 43644326960.195595,
       "hkd": 435593512826.81573,
       "huf": 19815106300490.17,
       "idr": 842571147724170.1,
       "ils": 206828117324.8428,
       "inr": 4603252962496.652,
       "jpy": 7961626956165.472,
       "krw": 72651337812730.8,
       "kwd": 17097064031.039402,
       "lkr": 17307041973566.283,
       "mmk": 116862839892606.58,
       "mxn": 964875088630.5122,
       "myr": 259800907582.81567,
       "ngn": 42757682295190.72,
       "nok": 598209630280.003,
       "nzd": 90069266396.73042,
       "php": 3094131832551.0957,
       "pkr": 15386367274331.22,
       "pln": 229118306339.70636,
       "rub": 5118476802715.296,
       "sar": 208728761677.32965,
       "sek": 607542210778.1566,
       "sgd": 75201388180.70624,
       "thb": 1958730260510.3274,
       "try": 1452367748260.1912,
       "twd": 1742044897828.4648,
       "uah": 2055280612316.9893,
       "vef": 5571017213.035077,
       "vnd": 1316093434421047.8,
       "zar": 1064927564460.6726,
       "xdr": 41837599286.58246,
       "xag": 2450736261.958864,
       "xau": 29038502.98439294,
       "bits": 1843264272556.5693,
       "sats": 184326427255656.94
     },
     "market_cap_percentage": {
       "btc": 48.161717958483926,
       "eth": 18.414612849932173,
       "usdt": 6.862074546607542,
       "bnb": 2.996209505839086,
       "usdc": 2.2667805128689533,
       "xrp": 2.0060785465058255,
       "steth": 1.1636305435490994,
       "ada": 0.8109802784244496,
       "doge": 0.7550986867900791,
       "sol": 0.6515265103397724
     },
     "market_cap_change_percentage_24h_usd": -2.5902012645979706,
     "updated_at": 1688723398
   }
 }



*/



struct GlobalData: Codable {
    let data: MarketDataModel?
}


struct MarketDataModel: Codable {
   
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    
    enum CodingKeys: String, CodingKey{
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
   
    
    var marketCap: String{
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String{
        if let item = totalVolume.first(where: { $0.key == "usd"}){
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String{
        if let item = marketCapPercentage.first(where: { $0.key == "btc"}){
            return item.value.asPercentString()
        }
        return ""
    }
    
}
