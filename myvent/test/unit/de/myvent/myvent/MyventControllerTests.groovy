package de.myvent.myvent



import org.junit.*
import grails.test.mixin.*

@TestFor(MyventController)
@Mock(Myvent)
class MyventControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/myvent/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.myventInstanceList.size() == 0
        assert model.myventInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.myventInstance != null
    }

    void testSave() {
        controller.save()

        assert model.myventInstance != null
        assert view == '/myvent/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/myvent/show/1'
        assert controller.flash.message != null
        assert Myvent.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/myvent/list'

        populateValidParams(params)
        def myvent = new Myvent(params)

        assert myvent.save() != null

        params.id = myvent.id

        def model = controller.show()

        assert model.myventInstance == myvent
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/myvent/list'

        populateValidParams(params)
        def myvent = new Myvent(params)

        assert myvent.save() != null

        params.id = myvent.id

        def model = controller.edit()

        assert model.myventInstance == myvent
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/myvent/list'

        response.reset()

        populateValidParams(params)
        def myvent = new Myvent(params)

        assert myvent.save() != null

        // test invalid parameters in update
        params.id = myvent.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/myvent/edit"
        assert model.myventInstance != null

        myvent.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/myvent/show/$myvent.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        myvent.clearErrors()

        populateValidParams(params)
        params.id = myvent.id
        params.version = -1
        controller.update()

        assert view == "/myvent/edit"
        assert model.myventInstance != null
        assert model.myventInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/myvent/list'

        response.reset()

        populateValidParams(params)
        def myvent = new Myvent(params)

        assert myvent.save() != null
        assert Myvent.count() == 1

        params.id = myvent.id

        controller.delete()

        assert Myvent.count() == 0
        assert Myvent.get(myvent.id) == null
        assert response.redirectedUrl == '/myvent/list'
    }
}
