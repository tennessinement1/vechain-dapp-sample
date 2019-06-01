const KVStorage = artifacts.require("KVStorage")


contract("KVStorage", accounts => {

    it("should have correct namespace", () => {
        return KVStorage.deployed()
        .then(instance => instance.namespace.call())
        .then(namespace => {
            assert.equal(namespace, 'morpheus-example-storage')
        })
    })

    it("shold be ok when set a new value", () => {
        let key = "0x496699b551fae009387328298b517b0b8be1c99f42d31ef2793ffcee5a7a316b"
        let value = "0x4de71f2d588aa8a1ea00fe8312d92966da424d9939a511fc0be81e65fad52af8"
        return KVStorage.deployed()
        .then(instance => {
            return instance.set(key, value, { from: accounts[0] })
            .then(() => {
                return instance.get.call(key).then(_value => {
                    assert.equal(_value, value)
                })
            })
        })
    })
    
})