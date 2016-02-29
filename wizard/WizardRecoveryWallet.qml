// Copyright (c) 2014-2015, The Monero Project
// 
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without modification, are
// permitted provided that the following conditions are met:
// 
// 1. Redistributions of source code must retain the above copyright notice, this list of
//    conditions and the following disclaimer.
// 
// 2. Redistributions in binary form must reproduce the above copyright notice, this list
//    of conditions and the following disclaimer in the documentation and/or other
//    materials provided with the distribution.
// 
// 3. Neither the name of the copyright holder nor the names of its contributors may be
//    used to endorse or promote products derived from this software without specific
//    prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
// THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import QtQuick 2.2
import moneroComponents 1.0
import QtQuick.Dialogs 1.2

Item {
    opacity: 0
    visible: false

    Behavior on opacity {
        NumberAnimation { duration: 100; easing.type: Easing.InQuad }
    }

    onOpacityChanged: visible = opacity !== 0

    function saveSettings(settingsObject) {
        settingsObject['account_name'] = uiItem.accountNameText
        settingsObject['words'] = uiItem.wordsTexttext
        settingsObject['wallet_path'] = uiItem.walletPath
    }

    function recoveryWallet() {

    }

    WizardManageWalletUI {
        id: uiItem
        accountNameText: qsTr("My account name")
        titleText: qsTr("We're ready to recover your account")
        wordsTextTitle: qsTr("Please enter your 25 word private key")
        wordsTextItem.clipboardButtonVisible: false
        wordsTextItem.tipTextVisible: false
        wordsTextItem.memoTextReadOnly: false
        wordsTextItem.memoText: ""
        wordsTextItem.onMemoTextChanged: {
            var wordsArray = wordsTextItem.memoText.trim().split(" ")
            //wizard.nextButton.enabled = wordsArray.length === 25
        }
    }
}
