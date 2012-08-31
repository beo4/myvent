package de.myvent.myvent

import org.springframework.dao.DataIntegrityViolationException

class MyventController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [myventInstanceList: Myvent.list(params), myventInstanceTotal: Myvent.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[myventInstance: new Myvent(params)]
			break
		case 'POST':
	        def myventInstance = new Myvent(params)
	        if (!myventInstance.save(flush: true)) {
	            render view: 'create', model: [myventInstance: myventInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'myvent.label', default: 'Myvent'), myventInstance.id])
	        redirect action: 'show', id: myventInstance.id
			break
		}
    }

    def show() {
        def myventInstance = Myvent.get(params.id)
        if (!myventInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'myvent.label', default: 'Myvent'), params.id])
            redirect action: 'list'
            return
        }

        [myventInstance: myventInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def myventInstance = Myvent.get(params.id)
	        if (!myventInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'myvent.label', default: 'Myvent'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [myventInstance: myventInstance]
			break
		case 'POST':
	        def myventInstance = Myvent.get(params.id)
	        if (!myventInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'myvent.label', default: 'Myvent'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (myventInstance.version > version) {
	                myventInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'myvent.label', default: 'Myvent')] as Object[],
	                          "Another user has updated this Myvent while you were editing")
	                render view: 'edit', model: [myventInstance: myventInstance]
	                return
	            }
	        }

	        myventInstance.properties = params

	        if (!myventInstance.save(flush: true)) {
	            render view: 'edit', model: [myventInstance: myventInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'myvent.label', default: 'Myvent'), myventInstance.id])
	        redirect action: 'show', id: myventInstance.id
			break
		}
    }

    def delete() {
        def myventInstance = Myvent.get(params.id)
        if (!myventInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'myvent.label', default: 'Myvent'), params.id])
            redirect action: 'list'
            return
        }

        try {
            myventInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'myvent.label', default: 'Myvent'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'myvent.label', default: 'Myvent'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
