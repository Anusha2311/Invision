//
//  ImageModel.swift
//  InvisionApp
//
//  Created by Anusha on 12/31/16.
//  Copyright © 2016 Rare Mile. All rights reserved.
//


import Foundation
import ObjectMapper

class ImageModel : NSObject,Mappable{
    
var t0 : [String]?
var t1 : [String]?
var t10 : [String]?
var t100 : [String]?
var t101 : [String]?
var t102 : [String]?
var t103 : [String]?
var t104 : [String]?
var t105 : [String]?
var t106 : [String]?
var t107 : [String]?
var t108 : [String]?
var t109 : [String]?
var t11 : [String]?
var t110 : [String]?
var t111 : [String]?
var t112 : [String]?
var t113 : [String]?
var t114 : [String]?
var t115 : [String]?
var t116 : [String]?
var t117 : [String]?
var t118 : [String]?
var t119 : [String]?
var t12 : [String]?
var t120 : [String]?
var t121 : [String]?
var t122 : [String]?
var t123 : [String]?
var t124 : [String]?
var t125 : [String]?
var t126 : [String]?
var t127 : [String]?
var t128 : [String]?
var t129 : [String]?
var t13 : [String]?
var t130 : [String]?
var t131 : [String]?
var t132 : [String]?
var t133 : [String]?
var t134 : [String]?
var t135 : [String]?
var t136 : [String]?
var t137 : [String]?
var t138 : [String]?
var t139 : [String]?
var t14 : [String]?
var t140 : [String]?
var t141 : [String]?
var t142 : [String]?
var t143 : [String]?
var t144 : [String]?
var t145 : [String]?
var t146 : [String]?
var t147 : [String]?
var t148 : [String]?
var t149 : [String]?
var t15 : [String]?
var t16 : [String]?
var t17 : [String]?
var t18 : [String]?
var t19 : [String]?
var t2 : [String]?
var t20 : [String]?
var t21 : [String]?
var t22 : [String]?
var t23 : [String]?
var t24 : [String]?
var t25 : [String]?
var t26 : [String]?
var t27 : [String]?
var t28 : [String]?
var t29 : [String]?
var t3 : [String]?
var t30 : [String]?
var t31 : [String]?
var t32 : [String]?
var t33 : [String]?
var t34 : [String]?
var t35 : [String]?
var t36 : [String]?
var t37 : [String]?
var t38 : [String]?
var t39 : [String]?
var t4 : [String]?
var t40 : [String]?
var t41 : [String]?
var t42 : [String]?
var t43 : [String]?
var t44 : [String]?
var t45 : [String]?
var t46 : [String]?
var t47 : [String]?
var t48 : [String]?
var t49 : [String]?
var t5 : [String]?
var t50 : [String]?
var t51 : [String]?
var t52 : [String]?
var t53 : [String]?
var t54 : [String]?
var t55 : [String]?
var t56 : [String]?
var t57 : [String]?
var t58 : [String]?
var t59 : [String]?
var t6 : [String]?
var t60 : [String]?
var t61 : [String]?
var t62 : [String]?
var t63 : [String]?
var t64 : [String]?
var t65 : [String]?
var t66 : [String]?
var t67 : [String]?
var t68 : [String]?
var t69 : [String]?
var t7 : [String]?
var t70 : [String]?
var t71 : [String]?
var t72 : [String]?
var t73 : [String]?
var t74 : [String]?
var t75 : [String]?
var t76 : [String]?
var t77 : [String]?
var t78 : [String]?
var t79 : [String]?
var t8 : [String]?
var t80 : [String]?
var t81 : [String]?
var t82 : [String]?
var t83 : [String]?
var t84 : [String]?
var t85 : [String]?
var t86 : [String]?
var t87 : [String]?
var t88 : [String]?
var t89 : [String]?
var t9 : [String]?
var t90 : [String]?
var t91 : [String]?
var t92 : [String]?
var t93 : [String]?
var t94 : [String]?
var t95 : [String]?
var t96 : [String]?
var t97 : [String]?
var t98 : [String]?
var t99 : [String]?


class func newInstance(map: Map) -> Mappable?{
    return ImageModel()
}
required init?(_ map: Map){}
    
private override init(){}

func mapping(map: Map)
{
    t0 <- map["0"]
    t1 <- map["1"]
    t10 <- map["10"]
    t100 <- map["100"]
    t101 <- map["101"]
    t102 <- map["102"]
    t103 <- map["103"]
    t104 <- map["104"]
    t105 <- map["105"]
    t106 <- map["106"]
    t107 <- map["107"]
    t108 <- map["108"]
    t109 <- map["109"]
    t11 <- map["11"]
    t110 <- map["110"]
    t111 <- map["111"]
    t112 <- map["112"]
    t113 <- map["113"]
    t114 <- map["114"]
    t115 <- map["115"]
    t116 <- map["116"]
    t117 <- map["117"]
    t118 <- map["118"]
    t119 <- map["119"]
    t12 <- map["12"]
    t120 <- map["120"]
    t121 <- map["121"]
    t122 <- map["122"]
    t123 <- map["123"]
    t124 <- map["124"]
    t125 <- map["125"]
    t126 <- map["126"]
    t127 <- map["127"]
    t128 <- map["128"]
    t129 <- map["129"]
    t13 <- map["13"]
    t130 <- map["130"]
    t131 <- map["131"]
    t132 <- map["132"]
    t133 <- map["133"]
    t134 <- map["134"]
    t135 <- map["135"]
    t136 <- map["136"]
    t137 <- map["137"]
    t138 <- map["138"]
    t139 <- map["139"]
    t14 <- map["14"]
    t140 <- map["140"]
    t141 <- map["141"]
    t142 <- map["142"]
    t143 <- map["143"]
    t144 <- map["144"]
    t145 <- map["145"]
    t146 <- map["146"]
    t147 <- map["147"]
    t148 <- map["148"]
    t149 <- map["149"]
    t15 <- map["15"]
    t16 <- map["16"]
    t17 <- map["17"]
    t18 <- map["18"]
    t19 <- map["19"]
    t2 <- map["2"]
    t20 <- map["20"]
    t21 <- map["21"]
    t22 <- map["22"]
    t23 <- map["23"]
    t24 <- map["24"]
    t25 <- map["25"]
    t26 <- map["26"]
    t27 <- map["27"]
    t28 <- map["28"]
    t29 <- map["29"]
    t3 <- map["3"]
    t30 <- map["30"]
    t31 <- map["31"]
    t32 <- map["32"]
    t33 <- map["33"]
    t34 <- map["34"]
    t35 <- map["35"]
    t36 <- map["36"]
    t37 <- map["37"]
    t38 <- map["38"]
    t39 <- map["39"]
    t4 <- map["4"]
    t40 <- map["40"]
    t41 <- map["41"]
    t42 <- map["42"]
    t43 <- map["43"]
    t44 <- map["44"]
    t45 <- map["45"]
    t46 <- map["46"]
    t47 <- map["47"]
    t48 <- map["48"]
    t49 <- map["49"]
    t5 <- map["5"]
    t50 <- map["50"]
    t51 <- map["51"]
    t52 <- map["52"]
    t53 <- map["53"]
    t54 <- map["54"]
    t55 <- map["55"]
    t56 <- map["56"]
    t57 <- map["57"]
    t58 <- map["58"]
    t59 <- map["59"]
    t6 <- map["6"]
    t60 <- map["60"]
    t61 <- map["61"]
    t62 <- map["62"]
    t63 <- map["63"]
    t64 <- map["64"]
    t65 <- map["65"]
    t66 <- map["66"]
    t67 <- map["67"]
    t68 <- map["68"]
    t69 <- map["69"]
    t7 <- map["7"]
    t70 <- map["70"]
    t71 <- map["71"]
    t72 <- map["72"]
    t73 <- map["73"]
    t74 <- map["74"]
    t75 <- map["75"]
    t76 <- map["76"]
    t77 <- map["77"]
    t78 <- map["78"]
    t79 <- map["79"]
    t8 <- map["8"]
    t80 <- map["80"]
    t81 <- map["81"]
    t82 <- map["82"]
    t83 <- map["83"]
    t84 <- map["84"]
    t85 <- map["85"]
    t86 <- map["86"]
    t87 <- map["87"]
    t88 <- map["88"]
    t89 <- map["89"]
    t9 <- map["9"]
    t90 <- map["90"]
    t91 <- map["91"]
    t92 <- map["92"]
    t93 <- map["93"]
    t94 <- map["94"]
    t95 <- map["95"]
    t96 <- map["96"]
    t97 <- map["97"]
    t98 <- map["98"]
    t99 <- map["99"]

}
}
