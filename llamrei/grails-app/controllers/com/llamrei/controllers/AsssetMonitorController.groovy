package com.llamrei.controllers

import com.llamrei.domain.Asset

class AssetMonitorController {

    def assetMonitorList = {

        [assetInstanceList: Asset.list(params), assetInstanceTotal: Asset.count()]
    }
}
