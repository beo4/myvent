package de.myvent.myvent

import org.springframework.dao.DataIntegrityViolationException

class TypeController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [typeInstanceList: Type.list(params), typeInstanceTotal: Type.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[typeInstance: new Type(params)]
			break
		case 'POST':
	        def typeInstance = new Type(params)
	        if (!typeInstance.save(flush: true)) {
	            render view: 'create', model: [typeInstance: typeInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'type.label', default: 'Type'), typeInstance.id])
	        redirect action: 'show', id: typeInstance.id
			break
		}
    }

    def show() {
        def typeInstance = Type.get(params.id)
        if (!typeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'type.label', default: 'Type'), params.id])
            redirect action: 'list'
            return
        }

        [typeInstance: typeInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def typeInstance = Type.get(params.id)
	        if (!typeInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'type.label', default: 'Type'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [typeInstance: typeInstance]
			break
		case 'POST':
	        def typeInstance = Type.get(params.id)
	        if (!typeInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'type.label', default: 'Type'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (typeInstance.version > version) {
	                typeInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'type.label', default: 'Type')] as Object[],
	                          "Another user has updated this Type while you were editing")
	                render view: 'edit', model: [typeInstance: typeInstance]
	                return
	            }
	        }

	        typeInstance.properties = params

	        if (!typeInstance.save(flush: true)) {
	            render view: 'edit', model: [typeInstance: typeInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'type.label', default: 'Type'), typeInstance.id])
	        redirect action: 'show', id: typeInstance.id
			break
		}
    }

    def delete() {
        def typeInstance = Type.get(params.id)
        if (!typeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'type.label', default: 'Type'), params.id])
            redirect action: 'list'
            return
        }

        try {
            typeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'type.label', default: 'Type'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'type.label', default: 'Type'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
